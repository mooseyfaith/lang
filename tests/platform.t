module platform;

def platform_api struct
{
    var win32_instance    HINSTANCE;
    var window_class_name cstring;
    
    var keys platform_button[256];
}

def platform_api_window struct
{
    var handle         HWND;
    var device_context HDC;
}

def platform_button struct
{
    var is_active             bool;
    var half_transition_count u8;
}

def platform_button_was_pressed func(button platform_button) (result bool)
{
    var x u32 = 2 - button.is_active;
    return button.half_transition_count >= x;
}

def platform_button_was_released func(button platform_button) (result bool)
{
    var x u32 = 1 + button.is_active;
    return button.half_transition_count >= x;
}

def platform_key_is_active func(platform platform_api; key u32) (result bool)
{
    return platform.keys[key].is_active;
}

def platform_key_was_pressed func(platform platform_api; key u32) (result bool)
{
    return platform_button_was_pressed(platform.keys[key]);
}

def platform_key_was_released func(platform platform_api; key u32) (result bool)
{
    return platform_button_was_released(platform.keys[key]);
}

def platform_button_update func(button platform_button ref; is_active bool)
{
    assert(button.is_active is_not is_active);
    
    button.is_active = is_active;
    
    // make sure overflow bit remains
    var overflow_mask = button.half_transition_count bit_and 0x80;
    button.half_transition_count = button.half_transition_count + 1;
    button.half_transition_count = button.half_transition_count bit_or overflow_mask;
}

//def platform_button mask u8
//{
//    is_active                       u1;
//    half_transition_count           u6;
//    half_transition_count_over_flow u1;
//}

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

def vec2s struct 
{
    var x s32;
    var y s32;
}

def platform_window_frame func(platform platform_api ref; window platform_api_window ref) (result vec2s)
{
    var rect RECT;
    platform_require(GetClientRect(window.handle, rect ref));
    
    var result vec2s;
    result.x = rect.right - rect.left;
    result.y = rect.bottom - rect.top;
    
    return result;
}

def platform_handle_messages func(platform platform_api ref) (result bool)
{
    var key_index;
    while key_index < 256
    {
        platform.keys[key_index].half_transition_count = 0;
        key_index = key_index + 1;
    }

    var msg MSG;
    while PeekMessage(msg ref, null, 0, 0, PM_REMOVE)
    {
        switch msg.message
        case WM_QUIT
        {
            return false;
        }
        case WM_KEYDOWN
        {
            platform_button_update(platform.keys[msg.wParam] ref, true);
        }
        case WM_KEYUP
        {
            platform_button_update(platform.keys[msg.wParam] ref, false);
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

def platform_require func(condition bool; location code_location = get_call_location(); condition_text cstring = get_call_argument_text(condition))
{
    if not condition
    {
        printf("\n%s,%s(%i,%i): Requirement Failed\n\n", location.file, location.function, location.line, location.column);
        printf("\tCondition '%s' is false.\n\n", condition_text);
        printf("\tGetLastError() = 0x%x\n", GetLastError());
        exit(0);
    }
}

def assert func(condition bool; location code_location = get_call_location(); condition_text cstring = get_call_argument_text(condition))
{
    if not condition
    {
        printf("\n%s,%s(%i,%i): Assertion Failed\n\n", location.file, location.function, location.line, location.column);
        printf("\tCondition '%s' is false.\n\n", condition_text);
        __debugbreak();
        exit(0);
    }
}