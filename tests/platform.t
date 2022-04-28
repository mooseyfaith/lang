module platform;

// on program start
var platform platform_api;
platform_init(platform ref);

def platform_api struct
{
    var win32_instance    HINSTANCE;
    var window_class_name cstring;
}

def platform_api_window struct
{
    var handle         HWND;
    var device_context HDC;
}

def platform_init func(platform platform_api ref)
{
    platform.win32_instance = GetModuleHandle(NULL) cast(HINSTANCE);
    platform.window_class_name = "My Window Class";
    
    var window_class WNDCLASSA;
    window_class.hInstance     = platform.win32_instance;
    window_class.lpfnWndProc   = platform_window_callback;
    window_class.hbrBackground = COLOR_BACKGROUND cast(HBRUSH);
    window_class.lpszClassName = platform.window_class_name;
    window_class.style         = CS_OWNDC;
    window_class.hCursor       = LoadCursor(NULL, IDC_ARROW);
    platform_require(RegisterClass(window_class ref));
}

def platform_window func(platform platform_api ref; window platform_api_window ref; title cstring)
{
    window.handle = CreateWindow(platform.window_class_name, title, WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, 640, 480, 0, 0, platform.win32_instance, 0);
    platform_require(window.handle is_not INVALID_HANDLE_VALUE);

    window.device_context = GetDC(window.handle);
    platform_require(window.device_context);
    ShowWindow(window.handle, SW_SHOW);
}

def platform_handle_messages func(platform platform_api ref) (result bool)
{
    var msg MSG;
    while PeekMessage(msg ref, null, 0, 0, PM_REMOVE)
    {
        if msg.message is WM_QUIT
        {
            return false;
        }
    
        TranslateMessage(msg ref);
        DispatchMessage(msg ref);
    }
    
    return true;
}

def platform_window_callback func(window HWND; msg UINT; w_param WPARAM; l_param LPARAM) (result LRESULT)
{
    switch msg
    case WM_DESTROY
    {
        PostQuitMessage(0);
        return 0;
    }
    
    return DefWindowProc(window, msg, w_param, l_param);
}

def platform_require func(condition bool; location code_location = get_call_location)
{
    if not condition
    {
        printf("\n%s,%s(%i,%i): Requirement Failed\n\n", location.file, location.function, location.line, location.column);
        printf("\tGetLastError() = 0x%x\n", GetLastError());
        exit(0);
    }
}