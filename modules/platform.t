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

def platform_key enum u8
{
    enter = 13;
}

def platform_button struct
{
    is_active             b8;
    half_transition_count u8;
}

def platform_button_was_pressed func(button platform_button) (result b8)
{
    return button.half_transition_count >= (2 - button.is_active);
}

def platform_button_was_released func(button platform_button) (result b8)
{
    return button.half_transition_count >= (1 + button.is_active);
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
    // assert(button.is_active is_not is_active);
    
    button.is_active = is_active;
    
    // make sure overflow bit remains
    var overflow_mask = button.half_transition_count bit_and 0x80;
    button.half_transition_count = (button.half_transition_count + 1) bit_or overflow_mask;
}

//def platform_button mask u8
//{
//    is_active                       u1;
//    half_transition_count           u6;
//    half_transition_count_over_flow u1;
//}

def print_value func(value u64; text string = get_call_argument_text(value); in_hex b8 = false)
{
    if in_hex 
        { printf("%.*s = 0x%llX\n\0".base cast(cstring), text.count cast(s32), text.base, value); }
    else
        { printf("%.*s = %llu\n\0".base cast(cstring), text.count cast(s32), text.base, value); }
}

def platform_init func(platform platform_api ref)
{
    platform.win32_instance = GetModuleHandleA(null) cast(HINSTANCE);
    platform.window_class_name = "My Window Class\0".base cast(cstring);
    
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

def platform_window_init func(platform platform_api ref; window platform_window ref; title string; width s32; height s32)
{
    assert(title[title.count - 1] is 0, "title needs to be 0-terminated");
    window.handle = CreateWindowExA(0, platform.window_class_name, title.base cast(cstring), WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, width, height, null, null, platform.win32_instance, 0);
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
    loop var key_index; 256
    {
        platform.keys[key_index].half_transition_count = 0;
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
            if msg.lParam bit_and 0x40000000 is 0
                { platform_button_update(platform.keys[msg.wParam] ref, true); }
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
    
    platform.delta_seconds = (time_ticks.QuadPart - platform.time_ticks) cast(f32) / platform.ticks_per_second;
    platform.time_ticks = time_ticks.QuadPart;
}

def platform_window_callback func WNDPROC
{
    switch msg
    case WM_DESTROY
    {
        PostQuitMessage(0);
        return 0;
    }
    
    return DefWindowProcA(window, msg, w_param, l_param);
}

def print_location func(location code_location)
{
    printf("%.*s/%.*s %.*s(%i,%i)\0".base cast(cstring), location.module.count cast(s32), location.module.base, location.function.count cast(s32), location.function.base, location.file.count cast(s32), location.file.base, location.line, location.column);
}

def platform_fatal_error_message func(label string; message string; location code_location; condition_text string)
{
    printf("\n\0".base cast(cstring));
    print_location(location);
    printf(": %.*s\n\n\0".base cast(cstring), label.count cast(s32), label.base);
    
    if message.count
        { printf("\t%.*s\n\n\0".base cast(cstring), message.count cast(s32), message.base); }
    
    printf("\tCondition '%.*s' is false.\n\n\0".base cast(cstring), condition_text.count cast(s32), condition_text.base);
}

def platform_require func(condition b8; message = ""; location code_location = get_call_location(); condition_text string = get_call_argument_text(condition))
{
    if not condition
    {
        platform_fatal_error_message("Platform Win32 Requirement Failed", message, location, condition_text);
        printf("\tGetLastError() = 0x%x\n\0".base cast(cstring), GetLastError());
        __debugbreak();
        ExitProcess(0);
    }
}

def require func(condition b8; message = ""; location code_location = get_call_location(); condition_text string = get_call_argument_text(condition))
{
    if not condition
    {
        platform_fatal_error_message("Requirement Failed", message, location, condition_text);
        __debugbreak();
        ExitProcess(0);
    }
}


def assert func(condition b8; message = ""; location code_location = get_call_location(); condition_text string = get_call_argument_text(condition))
{
    if not condition
    {
        platform_fatal_error_message("Assertion Failed", message, location, condition_text);
        __debugbreak();
        ExitProcess(0);
    }
}