
// "C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\um\Windows.h"
// different module name, so we don't expose platform dependend stuff to the user
module platform_win32;

import platform;

def GetLastError            func() (result u32)                       calling_convention "__stdcall" extern_binding("kernel32", true);
def ExitProcess             func(uExitCode u32)                       calling_convention "__stdcall" extern_binding("kernel32", true);
def GetSystemTimeAsFileTime func(lpSystemTimeAsFileTime FILETIME ref) calling_convention "__stdcall" extern_binding("kernel32", true);

def GetFileAttributesExA func(lpFileName cstring; fInfoLevelId s32; lpFileInformation u8 ref) (result s32) calling_convention "__stdcall" extern_binding("kernel32", true);
def CreateFileA func(lpFileName cstring; dwDesiredAccess u32; dwShareMode u32; lpSecurityAttributes u8 ref; dwCreationDisposition u32; dwFlagsAndAttributes u32; hTemplateFile HANDLE) (result HANDLE) calling_convention "__stdcall" extern_binding("kernel32", true);
def ReadFile func(hFile HANDLE; lpBuffer u8 ref; nNumberOfBytesToRead u32; lpNumberOfBytesRead u32 ref; lpOverlapped u8 ref) (result s32) calling_convention "__stdcall" extern_binding("kernel32", true);
def WriteFile func(hFile HANDLE; lpBuffer u8 ref; nNumberOfBytesToWrite u32; lpNumberOfBytesWritten u32 ref; lpOverlapped u8 ref) (result s32) calling_convention "__stdcall" extern_binding("kernel32", true);
def CloseHandle func(hObject HANDLE) (result s32) calling_convention "__stdcall" extern_binding("kernel32", true);

def PeekMessageA      func(lpMsg MSG ref; hWnd HWND; wMsgFilterMin u32; wMsgFilterMax u32; wRemoveMsg u32) (result s32) calling_convention "__stdcall" extern_binding("user32", true);
def LoadCursorA       func(hInstance HINSTANCE; lpCursorName cstring) (result HCURSOR)                     calling_convention "__stdcall" extern_binding("user32", true);
def RegisterClassA    func(lpWndClass WNDCLASSA ref) (result u16)                                          calling_convention "__stdcall" extern_binding("user32", true);
def DefWindowProcA    func WNDPROC                                                                         extern_binding("user32", true);
def TranslateMessage  func(lpMsg MSG ref) (result s32)                                                     calling_convention "__stdcall" extern_binding("user32", true);
def DispatchMessageA  func(lpMsg MSG ref) (result LRESULT)                                                 calling_convention "__stdcall" extern_binding("user32", true);
def PostQuitMessage   func(nExitCode s32)                                                                  calling_convention "__stdcall" extern_binding("user32", true);

// these actually take LARGE_INTEGER, but its the same as u64
def QueryPerformanceFrequency func(lpFrequency u64 ref) (result s32)                             calling_convention "__stdcall" extern_binding("user32", true);
def QueryPerformanceCounter   func(lpCounter u64 ref) (result s32)                               calling_convention "__stdcall" extern_binding("user32", true);

def GetDC             func(window HWND) (device_context HDC)                                               calling_convention "__stdcall" extern_binding("gdi32", true);
def ReleaseDC         func(window HWND; device_context HDC) (result s32)                                   calling_convention "__stdcall" extern_binding("gdi32", true);
def SwapBuffers       func(window HWND) (result u32)                                                       calling_convention "__stdcall" extern_binding("gdi32", true);

def GetModuleHandleA  func(window HWND) (module HMODULE)                                                   calling_convention "__stdcall" extern_binding("gdi32", true);
def ChoosePixelFormat func(hdc HDC; ppfd PIXELFORMATDESCRIPTOR ref) (result s32)                           calling_convention "__stdcall" extern_binding("gdi32", true);
def SetPixelFormat    func(hdc HDC; format s32; ppfd PIXELFORMATDESCRIPTOR ref) (result s32)               calling_convention "__stdcall" extern_binding("gdi32", true);
def ShowWindow        func(hWnd HWND; nCmdShow s32) (result s32)                                           calling_convention "__stdcall" extern_binding("gdi32", true);
def GetClientRect     func(hWnd HWND; lpRect RECT ref) (result s32)                                        calling_convention "__stdcall" extern_binding("gdi32", true);

def CreateWindowExA   func(dwExStyle u32; lpClassName cstring; lpWindowName cstring; dwStyle u32; X s32; Y s32; nWidth s32;nHeight s32; hWndParent HWND; hMenu HMENU; hInstance HINSTANCE; lpParam u8 ref) (result HWND) calling_convention "__stdcall" extern_binding("user32", true);
def DestroyWindow     func(window HWND) (result u32)                                                       calling_convention "__stdcall" extern_binding("gdi32", true);

def WNDPROC func(window HWND; msg u32; w_param WPARAM; l_param LPARAM) (result LRESULT) calling_convention "__stdcall";

def HANDLE    type u8 ref;
def HWND      type u8 ref;
def HDC       type u8 ref;
def HMENU     type u8 ref;
def HMODULE   type u8 ref;
def HINSTANCE type u8 ref;
def HCURSOR   type u8 ref;
def HICON     type u8 ref;
def HBRUSH    type u8 ref;

def WPARAM  type u64;
def LPARAM  type s64;
def LRESULT type s64;

def POINT struct
{
    x s32;
    y s32;
}

def RECT struct
{
    left   s32;
    top    s32;
    right  s32;
    bottom s32;
}

def MSG struct
{
  hwnd     HWND;
  message  u32;
  wParam   WPARAM;
  lParam   LPARAM;
  time     u32;
  pt       POINT;
  // lPrivate u32;
}

def WNDCLASSA struct
{
    style         u32;
    lpfnWndProc   WNDPROC;
    cbClsExtra    s32;
    cbWndExtra    s32;
    hInstance     HINSTANCE;
    hIcon         HICON;
    hCursor       HCURSOR;
    hbrBackground HBRUSH;
    lpszMenuName  cstring;
    lpszClassName cstring;
}

def PIXELFORMATDESCRIPTOR struct
{
    nSize           u16;
    nVersion        u16;
    dwFlags         u32;
    iPixelType      u8;
    cColorBits      u8;
    cRedBits        u8;
    cRedShift       u8;
    cGreenBits      u8;
    cGreenShift     u8;
    cBlueBits       u8;
    cBlueShift      u8;
    cAlphaBits      u8;
    cAlphaShift     u8;
    cAccumBits      u8;
    cAccumRedBits   u8;
    cAccumGreenBits u8;
    cAccumBlueBits  u8;
    cAccumAlphaBits u8;
    cDepthBits      u8;
    cStencilBits    u8;
    cAuxBuffers     u8;
    iLayerType      u8;
    bReserved       u8;
    dwLayerMask     u32;
    dwVisibleMask   u32;
    dwDamageMask    u32;
}

def FILETIME struct
{
  dwLowDateTime  u32;
  dwHighDateTime u32;
}

def WIN32_FILE_ATTRIBUTE_DATA struct
{
    dwFileAttributes u32;
    ftCreationTime FILETIME;
    ftLastAccessTime FILETIME;
    ftLastWriteTime FILETIME;
    nFileSizeHigh u32;
    nFileSizeLow  u32;
}

def INVALID_HANDLE_VALUE = (-1) cast(HANDLE);

def CS_OWNDC = 0x0020 cast(u32);

def IDC_ARROW = 32512 cast(u16) cast(cstring);

def COLOR_BACKGROUND = 1 cast(s32);

def CW_USEDEFAULT = 0x80000000 cast(s32);

def WS_OVERLAPPEDWINDOW = 0x00CF0000 cast(u32);

def SW_HIDE             = 0 cast(u32);
def SW_SHOWNORMAL       = 1 cast(u32);
def SW_NORMAL           = 1 cast(u32);
def SW_SHOWMINIMIZED    = 2 cast(u32);
def SW_SHOWMAXIMIZED    = 3 cast(u32);
def SW_MAXIMIZE         = 3 cast(u32);
def SW_SHOWNOACTIVATE   = 4 cast(u32);
def SW_SHOW             = 5 cast(u32);
def SW_MINIMIZE         = 6 cast(u32);
def SW_SHOWMINNOACTIVE  = 7 cast(u32);
def SW_SHOWNA           = 8 cast(u32);
def SW_RESTORE          = 9 cast(u32);
def SW_SHOWDEFAULT      = 10 cast(u32);
def SW_FORCEMINIMIZE    = 11 cast(u32);
def SW_MAX              = 11 cast(u32);

def PM_REMOVE = 1 cast(u32);

def WM_NULL                         = 0x0000 cast(u32);
def WM_CREATE                       = 0x0001 cast(u32);
def WM_DESTROY                      = 0x0002 cast(u32);
def WM_MOVE                         = 0x0003 cast(u32);
def WM_SIZE                         = 0x0005 cast(u32);

def WM_QUIT                         = 0x0012 cast(u32);

def WM_INPUT                        = 0x00FF cast(u32);
def WM_KEYFIRST                     = 0x0100 cast(u32);
def WM_KEYDOWN                      = 0x0100 cast(u32);
def WM_KEYUP                        = 0x0101 cast(u32);
def WM_CHAR                         = 0x0102 cast(u32);
def WM_DEADCHAR                     = 0x0103 cast(u32);
def WM_SYSKEYDOWN                   = 0x0104 cast(u32);
def WM_SYSKEYUP                     = 0x0105 cast(u32);
def WM_SYSCHAR                      = 0x0106 cast(u32);
def WM_SYSDEADCHAR                  = 0x0107 cast(u32);
def WM_UNICHAR                      = 0x0109 cast(u32);
def WM_KEYLAST                      = 0x0109 cast(u32);
def UNICODE_NOCHAR                  = 0xFFFF cast(u32);

def PFD_TYPE_RGBA               = 0 cast(u8);
def PFD_MAIN_PLANE              = 0 cast(u8);
def PFD_DOUBLEBUFFER            = 0x00000001 cast(u8);
def PFD_STEREO                  = 0x00000002 cast(u8);
def PFD_DRAW_TO_WINDOW          = 0x00000004 cast(u8);
def PFD_DRAW_TO_BITMAP          = 0x00000008 cast(u8);
def PFD_SUPPORT_GDI             = 0x00000010 cast(u8);
def PFD_SUPPORT_OPENGL          = 0x00000020 cast(u8);
def PFD_GENERIC_FORMAT          = 0x00000040 cast(u8);
def PFD_NEED_PALETTE            = 0x00000080 cast(u8);
def PFD_NEED_SYSTEM_PALETTE     = 0x00000100 cast(u8);
def PFD_SWAP_EXCHANGE           = 0x00000200 cast(u8);
def PFD_SWAP_COPY               = 0x00000400 cast(u8);
def PFD_SWAP_LAYER_BUFFERS      = 0x00000800 cast(u8);
def PFD_GENERIC_ACCELERATED     = 0x00001000 cast(u8);
def PFD_SUPPORT_DIRECTDRAW      = 0x00002000 cast(u8);
def PFD_DIRECT3D_ACCELERATED    = 0x00004000 cast(u8);
def PFD_SUPPORT_COMPOSITION     = 0x00008000 cast(u8);

def GetFileExInfoStandard = 0 cast(s32);

def GENERIC_READ    = 0x80000000 cast(u32);
def GENERIC_WRITE   = 0x40000000 cast(u32);
def GENERIC_EXECUTE = 0x20000000 cast(u32);
def GENERIC_ALL     = 0x10000000 cast(u32);

def FILE_SHARE_READ       = 0x00000001 cast(u32);
def FILE_ATTRIBUTE_NORMAL = 0x00000080 cast(u32);

def CREATE_NEW    = 1 cast(u32);
def CREATE_ALWAYS = 2 cast(u32);
def OPEN_EXISTING = 3 cast(u32);
def OPEN_ALWAYS   = 4 cast(u32);