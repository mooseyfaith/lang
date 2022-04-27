module gl;

import platform;

def gl_api struct
{
    var win32_context HGLRC;
}

def init func(gl gl_api ref; platform platform_api ref)
{
    var window_class WNDCLASSA;
    window_class.hInstance     = platform.win32_instance;
    window_class.lpfnWndProc   = DefWindowProc;
    window_class.hbrBackground = COLOR_BACKGROUND cast(HBRUSH);
    window_class.lpszClassName = "gl dummy window class";
    window_class.style         = CS_OWNDC;
    window_class.hCursor       = LoadCursor(NULL, IDC_ARROW);
    if not RegisterClass(window_class ref)
    {
        printf("GetLastError() = 0x%x\n", GetLastError());
        return;
    }
    
}