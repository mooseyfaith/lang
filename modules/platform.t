module platform;

import platform_win32;

def platform_api struct
{
    keys platform_button[256];
    delta_seconds f32;
    
    // win32 specific
    win32_instance    HINSTANCE;
    window_class_name cstring;
    time_ticks        u64;
    ticks_per_second  u64;
}

def platform_window struct
{
    handle         HWND;
    device_context HDC;
}

def platform_button struct
{
    is_active             b8;
    half_transition_count u8;
}

def platform_button_was_pressed func(button platform_button) (result b8)
{
    var x u32 = 2 - button.is_active;
    return button.half_transition_count >= x;
}

def platform_button_was_released func(button platform_button) (result b8)
{
    var x u32 = 1 + button.is_active;
    return button.half_transition_count >= x;
}

def platform_key_is_active func(platform platform_api; key u32) (result b8)
{
    return platform.keys[key].is_active;
}

def platform_key_was_pressed func(platform platform_api; key u32) (result b8)
{
    return platform_button_was_pressed(platform.keys[key]);
}

def platform_key_was_released func(platform platform_api; key u32) (result b8)
{
    return platform_button_was_released(platform.keys[key]);
}

def platform_button_update func(button platform_button ref; is_active b8)
{
    //assert(button.is_active is_not is_active);
    
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

def print_value func(value u64; text cstring = get_call_argument_text(value); in_hex b8 = false)
{
    if in_hex 
        { printf("%s = 0x%llX\n", text, value); }
    else
        { printf("%s = %llu\n", text, value); }
}

def platform_init func(platform platform_api ref)
{
    platform.win32_instance = GetModuleHandleA(null) cast(HINSTANCE);
    platform.window_class_name = "My Window Class";
    
    var window_class WNDCLASSA;
    window_class.hInstance     = platform.win32_instance;
    window_class.lpfnWndProc   = platform_window_callback;
    window_class.hbrBackground = COLOR_BACKGROUND cast(ssize) cast(HBRUSH);
    window_class.lpszClassName = platform.window_class_name;
    window_class.style         = CS_OWNDC;
    window_class.hCursor       = LoadCursorA(null, IDC_ARROW);
    platform_require(RegisterClassA(window_class ref));
    
    var ticks_per_second LARGE_INTEGER;
    platform_require(QueryPerformanceFrequency(ticks_per_second ref));
    platform.ticks_per_second = ticks_per_second.QuadPart;
    
    var time_ticks LARGE_INTEGER;
    platform_require(QueryPerformanceCounter(time_ticks ref));
    platform.time_ticks = time_ticks.QuadPart;
}

def platform_window_init func(platform platform_api ref; window platform_window ref; title cstring; width s32; height s32)
{
    window.handle = CreateWindowExA(0, platform.window_class_name, title, WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, width, height, null, null, platform.win32_instance, 0);
    platform_require(window.handle is_not null);

    window.device_context = GetDC(window.handle);
    platform_require(window.device_context is_not null);
    ShowWindow(window.handle, SW_SHOW);
}

def vec2s struct 
{
    x s32;
    y s32;
}

def platform_window_frame func(platform platform_api ref; window platform_window ref) (result vec2s)
{
    var rect RECT;
    platform_require(GetClientRect(window.handle, rect ref));
    
    var result vec2s;
    result.x = rect.right - rect.left;
    result.y = rect.bottom - rect.top;
    
    return result;
}

def platform_handle_messages func(platform platform_api ref) (result b8)
{
    var key_index;
    while key_index < 256
    {
        platform.keys[key_index].half_transition_count = 0;
        key_index = key_index + 1;
    }

    var msg MSG;
    while PeekMessageA(msg ref, null, 0, 0, PM_REMOVE)
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
        DispatchMessageA(msg ref);
    }
    
    platform_update_time(platform);
    
    return true;
}

def platform_update_time func(platform platform_api ref)
{
    var time_ticks LARGE_INTEGER;
    platform_require(QueryPerformanceCounter(time_ticks ref));
    
    var delta_ticks u64 = time_ticks.QuadPart - platform.time_ticks;
    platform.delta_seconds = delta_ticks cast(f32) / platform.ticks_per_second;
    
    platform.time_ticks = time_ticks.QuadPart;
}

//def platform_window_callback func WNDPROC
def platform_window_callback func(window HWND; msg u32; w_param WPARAM; l_param LPARAM) (result LRESULT)
{
    switch msg
    case WM_DESTROY
    {
        PostQuitMessage(0);
        return 0;
    }
    
    return DefWindowProcA(window, msg, w_param, l_param);
}

def platform_require func(condition b8; location code_location = get_call_location(); condition_text cstring = get_call_argument_text(condition))
{
    if not condition
    {
        printf("\n%s,%s(%i,%i): Requirement Failed\n\n", location.file, location.function, location.line, location.column);
        printf("\tCondition '%s' is false.\n\n", condition_text);
        printf("\tGetLastError() = 0x%x\n", GetLastError());
        __debugbreak();
        ExitProcess(0);
    }
}

def require func(condition b8; location code_location = get_call_location(); condition_text cstring = get_call_argument_text(condition))
{
    if not condition
    {
        printf("\n%s,%s(%i,%i): Requirement Failed\n\n", location.file, location.function, location.line, location.column);
        printf("\tCondition '%s' is false.\n\n", condition_text);
        __debugbreak();
        ExitProcess(0);
    }
}


def assert func(condition b8; location code_location = get_call_location(); condition_text cstring = get_call_argument_text(condition))
{
    if not condition
    {
        printf("\n[%s] %s,%s(%i, %i): Assertion Failed\n\n", location.module, location.file, location.function, location.line, location.column);
        printf("\tCondition '%s' is false.\n\n", condition_text);
        __debugbreak();
        ExitProcess(0);
    }
}