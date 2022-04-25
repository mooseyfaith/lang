
var x = 12;
if x {
    x = 41;
}
printf("fun %i", x);

switch x
{
    ?
    {
        printf("default\n");
    }
    
    41
    {
        printf("41!\n");
    }
    
    12
    {
        printf("no way\n");
    }
}

var platform platform_api;
platform_init(platform ref);

var window platform_api_window;
platform_window(platform ref, window ref, "test");

while true
{
    platform_handle_messages(platform ref);
}

def platform_api struct
{
    var win32_instance HINSTANCE;
    var window_class_name cstring;
}

def platform_api_window struct
{
    var handle HWND;
    var device_context HDC;
}

def platform_init func(platform platform_api ref)
{
    platform.win32_instance = GetModuleHandle(NULL) cast(HINSTANCE);
    platform.window_class_name = "My Window Class";
    
    var window_class WNDCLASSA;
    window_class.hInstance     = platform.win32_instance;
    window_class.lpfnWndProc   = DefWindowProc;
    window_class.hbrBackground = COLOR_BACKGROUND cast(HBRUSH);
    window_class.lpszClassName = platform.window_class_name;
    window_class.style         = CS_OWNDC;
    window_class.hCursor       = LoadCursor(NULL, IDC_ARROW);
    if not RegisterClass(window_class ref)
    {
        printf("GetLastError() = 0x%x\n", GetLastError());
        return;
    }
}

def platform_window func(platform platform_api ref; window platform_api_window ref; title cstring)
{
    window.handle = CreateWindow(platform.window_class_name, title, WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, 640, 480, 0, 0, platform.win32_instance, 0);
    if not window.handle
    {
        printf("GetLastError() = 0x%x\n", GetLastError());
        return;
    }

    window.device_context = GetDC(window.handle);
    ShowWindow(window.handle, SW_SHOW);
}

def platform_handle_messages func(platform platform_api ref)
{
    var msg MSG;
    while PeekMessage(msg ref, null, 0, 0, PM_REMOVE)
    {
        TranslateMessage(msg ref);
        DispatchMessage(msg ref);
    }
}