module platform;

import platform_win32;
import random;
import string;

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

def platform_init func(platform platform_api ref)
{
    platform.win32_instance = GetModuleHandleA(null) cast(HINSTANCE);
    platform.window_class_name = "My Window Class\0".base cast(cstring);
    
    var window_class WNDCLASSA;
    window_class.hInstance     = platform.win32_instance;
    window_class.lpfnWndProc   = get_function_reference(platform_window_callback WNDPROC);
    window_class.hbrBackground = COLOR_BACKGROUND cast(ssize) cast(HBRUSH);
    window_class.lpszClassName = platform.window_class_name;
    window_class.style         = CS_OWNDC;
    window_class.hCursor       = LoadCursorA(null, IDC_ARROW);
    platform_require(RegisterClassA(window_class ref));
    
    platform_require(QueryPerformanceFrequency(platform.ticks_per_second ref));
    platform_require(QueryPerformanceCounter(platform.time_ticks ref));
}

def platform_window_init func(platform platform_api ref; window platform_window ref; title string; width s32; height s32)
{
    platform_is_zero_terminated(title);
    
    window.handle = CreateWindowExA(0, platform.window_class_name, title.base cast(cstring), WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, width, height, null, null, platform.win32_instance, null);
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
    loop var key_index; platform.keys.count
    {
        platform.keys[key_index].half_transition_count = 0;
    }

    var msg MSG;
    while PeekMessageA(msg ref, null, 0, 0, PM_REMOVE)
    {
        switch msg.message;
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
    var time_ticks u64;
    platform_require(QueryPerformanceCounter(time_ticks ref));
    
    platform.delta_seconds = (time_ticks - platform.time_ticks) cast(f32) / platform.ticks_per_second;
    platform.time_ticks = time_ticks;
}

def platform_window_callback func WNDPROC
{
    switch msg;
    case WM_DESTROY
    {
        PostQuitMessage(0);
        return 0;
    }
    
    return DefWindowProcA(window, msg, w_param, l_param);
}

def print_location func(location code_location)
{
    print(location.module); print("/"); print(location.function); print(" "); print(location.file); print("("); print_u64(location.line); print(","); print_u64(location.column); print(")"); 
    
    //printf("%.*s/%.*s %.*s(%i,%i)\0".base cast(cstring), location.module.count cast(s32), location.module.base, location.function.count cast(s32), location.function.base, location.file.count cast(s32), location.file.base, location.line, location.column);
    
}

def platform_fatal_error_message func(label string; message string; location code_location; condition_text string)
{
    print("\n");
    print_location(location); print(": "); print(label); print("\n\n");

    if message.count
        { print("\t"); print(message); print("\n\n"); }
    
    print("\tCondition '"); print(condition_text); print("' is false.\n\n");

    //printf("\n\0".base cast(cstring));
    //print_location(location);
    //printf(": %.*s\n\n\0".base cast(cstring), label.count cast(s32), label.base);
    
    //if message.count
//        { printf("\t%.*s\n\n\0".base cast(cstring), message.count cast(s32), message.base); }
    
    //printf("\tCondition '%.*s' is false.\n\n\0".base cast(cstring), condition_text.count cast(s32), condition_text.base);
}

def platform_require func(condition b8; message = ""; location code_location = get_call_location(); condition_text string = get_call_argument_text(condition))
{
    if not condition
    {
        platform_fatal_error_message("Platform Win32 Requirement Failed", message, location, condition_text);
        print("\tGetLastError() = 0x");
        print_hex(GetLastError());
        print("\n");
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

def assert func(condition b8; message = ""; location = get_call_location(); condition_text = get_call_argument_text(condition))
{
    if not condition
    {
        platform_fatal_error_message("Assertion Failed", message, location, condition_text);
        __debugbreak();
        ExitProcess(0);
    }
}

def platform_get_random_from_time func(platform platform_api ref) (random random_pcg)
{
    var filetime FILETIME;
    GetSystemTimeAsFileTime(filetime ref);
    var random random_pcg = filetime ref cast(random_pcg ref) . ;
    
    return random;
}

def platform_file_info struct
{
    byte_count      u64;
    write_timestamp u64;
    ok b8;
}

def platform_is_zero_terminated func(text string; location = get_call_location())
{
    assert(text[text.count - 1] is 0, "title needs to be 0-terminated", location);
}

def platform_get_file_info func(platform platform_api ref; path string) (result platform_file_info)
{
    platform_is_zero_terminated(path);
    
    var data WIN32_FILE_ATTRIBUTE_DATA;
    var ok = GetFileAttributesExA(path.base cast(cstring), GetFileExInfoStandard, data ref);
    if not ok
        { return type(platform_file_info) {}; }
    
    // we can't just cast to u64, because ms messed up order of high and low values
    var byte_count      = (data.nFileSizeHigh cast(u64) bit_shift_right 32) bit_or (data.nFileSizeLow cast(u64));
    var write_timestamp = (data.ftLastWriteTime.dwHighDateTime cast(u64) bit_shift_right 32) bit_or (data.ftLastWriteTime.dwLowDateTime cast(u64));
    
    return type(platform_file_info) { byte_count; write_timestamp; true };
}

def platform_read_entire_file func(data u8[]; platform platform_api ref; path string) (result u8[])
{
    platform_is_zero_terminated(path);
    
    var file_handle = CreateFileA(path.base cast(cstring), GENERIC_READ, FILE_SHARE_READ, null, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, null);
    
    // might be written to, or does not exist
    if file_handle is INVALID_HANDLE_VALUE
        { return type(u8[]) {}; }
        
    var file_info = platform_get_file_info(platform, path);
    if not file_info.ok or (file_info.byte_count > data.count)
        { return type(u8[]) {}; }
    
    if data.count > file_info.byte_count
        { data.count = file_info.byte_count; }
    
    // we can only read in ~4gb chunks
    var offset usize = 0;
    while offset < data.count
    {
        var byte_count u32;
        
        var count = data.count - offset;
        if count > 0xFFFFFFFF 
            { byte_count = 0xFFFFFFFF; }
        else
            { byte_count = count cast(u32); }
        
        var read_byte_count u32;
        var ok b8 = ReadFile(file_handle, data.base + offset, byte_count, read_byte_count ref, null);
        ok = ok and (byte_count is read_byte_count);
        if not ok
            { return type(u8[]) {}; }
        
        offset = offset + byte_count;
    }
    
    CloseHandle(file_handle);
    
    return data;
}

def platform_write_entire_file func(platform platform_api ref; path string; data u8[]) (ok b8)
{
    platform_is_zero_terminated(path);
    
    var file_handle = CreateFileA(path.base cast(cstring), GENERIC_WRITE, 0, null, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, null);
    if file_handle is INVALID_HANDLE_VALUE
        { return false; }
    
    while data.count
    {
        var byte_count u32;
        // has higher bits set
        if data.count > 0xFFFFFFFF 
            { byte_count = 0xFFFFFFFF; }
        else
            { byte_count = data.count cast(u32); }
        
        var write_byte_count u32;
        var ok = WriteFile(file_handle, data.base, byte_count, write_byte_count ref, null);
        ok = ok and (byte_count is write_byte_count);
        if not ok
            { return false; }
        
        data.base  = data.base  + byte_count;
        data.count = data.count - byte_count;
    }
    
    CloseHandle(file_handle);
    
    return true;
}


// for convenience
def as_cstring func(text string; location = get_call_location()) (result cstring)
{
    assert(text[text.count - 1] is 0, "text needs to be 0-terminated", location);
    return text.base cast(cstring);
}