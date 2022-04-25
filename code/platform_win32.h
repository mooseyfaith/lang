
// platform_win32.h
// (c) 2021 Tafil Kajtazi

#pragma once

//#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <xinput.h>

#include <stdio.h>
#include <stdlib.h>

#define mlocation_file     __FILE__
#define mlocation_function __FUNCTION__
#define mlocation_line     __LINE__

#define platform_fatal_error_location_va_declaration \
    static bool platform_fatal_error_location_va(cstring file, cstring function, u32 line, cstring label, cstring format, va_list va_arguments)

#define platform_fatal_error_location_declaration \
    static bool platform_fatal_error_location(cstring file, cstring function, u32 line, cstring label, cstring format, ...)

platform_fatal_error_location_va_declaration;
platform_fatal_error_location_declaration;

#define platform_conditional_fatal_error_location(condition, file, function, line, label, format, ...)  \
    if (!(condition)) \
        if (platform_fatal_error_location(file, function, line, label, format,  __VA_ARGS__)) \
            __debugbreak();

#if defined _DEBUG

    #define assert_location(condition, file, function, line, ...) \
        platform_conditional_fatal_error_location(condition, file, function, line, "Assertion Failure", "Assertion:\n    " # condition "\nfailed.\n\n" __VA_ARGS__)

    #define assert(condition, ...) assert_location(condition, __FILE__, __FUNCTION__, __LINE__, __VA_ARGS__)
    
#else

    #define assert_location(...)
    #define assert(...)

#endif

#define require_location(condition, file, function, line, ...) \
        platform_conditional_fatal_error_location(condition, file, function, line, "Error", "Requirement:\n    " # condition "\nfailed.\n\n" __VA_ARGS__)

#define require(condition, ...) require_location(condition, __FILE__, __FUNCTION__, __LINE__, __VA_ARGS__)

#define unreachable_codepath  assert(false, "unreachable codepath")
#define cases_complete        default: unreachable_codepath

platform_fatal_error_location_va_declaration
{
    cstring layout =
        "%s,%d\n"
        "    %s\n"
        "\n";

    u32 byte_count = _scprintf(layout, file, line, function);
    byte_count += _vscprintf(format, va_arguments);
     
    // TODO: remove malloc
    string text = { byte_count + 1, (u8 *) malloc(byte_count + 1) };
    
    u32 offset = 0;
    offset += sprintf_s((char *) text.base, text.count, layout, file, line, function);
    offset += vsprintf_s((char *) text.base + offset, text.count - offset, format, va_arguments);
    
    printf("\n%s:\n%s\n", label, text.base);
    
    bool do_break = false;
    switch (MessageBox(null, (char *) text.base, label, MB_TASKMODAL | MB_CANCELTRYCONTINUE | MB_ICONERROR))
    { 
        // Instead of calling debug break here, we just return if we want to break.
        // This way we can place the break in the assert macro and actually break at the right position
        case IDTRYAGAIN:
        {
            do_break = true;
        } break;
        
        case IDCANCEL:
        {
            exit(-1);
        } break;
    }
    
    // TODO: remove free
    free(text.base);
    
    return do_break;
}

platform_fatal_error_location_declaration
{
    va_list va_arguments;
    va_start(va_arguments, format);
    
    bool do_break = platform_fatal_error_location_va(file, function, line, label, format, va_arguments);
    
    va_end(va_arguments);
    
    return do_break;
}

#pragma comment(lib, "kernel32.lib")
#pragma comment(lib, "user32.lib")
#pragma comment(lib, "gdi32.lib")
#pragma comment(lib, "Winmm.lib")
#pragma comment(lib, "Shell32.lib")
#pragma comment(lib, "hid.lib")
#pragma comment(lib, "d3d10_1.lib")

#define platform_main_declaration int WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nShowCmd)

#define window_callback_signature(name) LRESULT CALLBACK name(HWND window_handle, UINT message, WPARAM w_param, LPARAM l_param)

#define xinput_signature_get_state(name) DWORD name(DWORD dwUserIndex, XINPUT_STATE *pState)
typedef xinput_signature_get_state((*xinput_function_get_state));

#define xinput_signature_get_capabilities(name) DWORD name(DWORD dwUserIndex, DWORD dwFlags,XINPUT_CAPABILITIES *pCapabilities)
typedef xinput_signature_get_capabilities((*xinput_function_get_capabilities));

union platform_button
{
    struct
    {
        u8 is_active:    1;
        u8 was_repeated: 1;
        u8 change_count_overflow: 1;
        u8 change_count: 5;
    };
    
    u8 value;
};

struct platform_gamepad_stick
{
    vec2 direction;
    vec2 raw_direction;
    platform_button direction_as_button;
    platform_button button;
};

struct platform_gamepad
{
    platform_gamepad_stick left_stick, right_stick;
    
    struct
    {
        f32 raw_value;
        f32 value;
        platform_button button;
    } left_trigger, right_trigger;
    
    union
    {
        struct
        {
            platform_button right, up, left, down;
        };
        
        platform_button buttons[4];
    } dpad, action;
    
    platform_button left_shoulder, right_shoulder;
    platform_button start, select, home;
    
    bool is_enabled;
    
    struct
    {
        HANDLE device;
    } win32;
};

struct platform_character
{
    u32 utf32_code;
    
    u8 was_repeated       : 1;
    u8 with_left_shift    : 1;
    u8 with_right_shift   : 1;
    u8 with_left_control  : 1;
    u8 with_right_control : 1;
    u8 with_left_alt      : 1;
    u8 with_right_alt     : 1;
};

array_type(platform_character_array, platform_character);

enum platform_character_control
{
    platform_character_escape    = 27,
    platform_character_delete    = 127,
    platform_character_backspace = '\b',
    platform_character_new_line  = '\n',
    platform_character_tab       = '\t',
    
#if 0
    platform_character_left     = '\n',
    platform_character_right    = '\n',
    platform_character_down     = '\n',
    platform_character_up       = '\n',
    
    platform_character_begin     = '\n',
    platform_character_end     = '\n',
    platform_character_page_down     = '\n',
    platform_character_page_up       = '\n',
#endif
};

struct platform_window;

struct memory_arena;

struct platform_api
{
    struct
    {
        LPCSTR    window_class_name;
        HINSTANCE instance;
        
        TIMECAPS timecaps;
        u64 ticks_per_second;
        u64 last_time_ticks;
        
        bool check_gamepad_connections;
        
        xinput_function_get_state        XInputGetState;
        xinput_function_get_capabilities XInputGetCapabilities;
        
        HWND focus_window_handle;
        platform_window *first_window;
    } win32;
    
    platform_button keys[256];
    platform_gamepad gamepads[8];
    
    struct
    {
        s32 display_x, display_y;
        s32 previous_display_x, previous_display_y;
        platform_button left, middle, right;
        s32 wheel_delta; // in pages
    } mouse;
    
    platform_character characters[256];
    u32 character_count; // max array_count(characters)
    u32 character_and_missed_count; // includes characters, that didn't fit in the buffer
    u32 processed_character_count; // set by user
    
    f32 delta_seconds;
    bool do_quit;
    
    memory_arena *arena_list;
    memory_arena **arena_list_tail;
};

struct platform_window
{
    cstring title;
    
    s32 x, y, width, height;
    bool was_resized;
    bool has_mouse_focus;
    bool was_destroyed;
    
    struct
    {
        platform_api *platform;
        platform_window *next;
        HWND handle;
        HDC  device_context;
    } win32;
};

struct platform_file_info
{
    bool ok;
    u64 byte_count;
    u64 write_timestamp;
};

void win32_get_window_box(platform_window *window)
{
    MONITORINFO monitor_info = { sizeof(monitor_info) };
    GetMonitorInfo(MonitorFromWindow(window->win32.handle, MONITOR_DEFAULTTOPRIMARY), &monitor_info);
    
    RECT rectangle;
    GetClientRect(window->win32.handle, &rectangle);
    POINT min;
    min.x = rectangle.left;
    min.y = rectangle.bottom;
    ClientToScreen(window->win32.handle, &min);
    
    s32 width  = rectangle.right - rectangle.left;
    s32 height = rectangle.bottom - rectangle.top;
    
    window->was_resized = (window->width != width) || (window->height != height);
    
    window->x      = min.x;
    window->y      = monitor_info.rcMonitor.bottom - min.y;
    window->width  = width;
    window->height = height;
}

window_callback_signature(window_callback)
{
    auto window = (platform_window *) GetWindowLongPtrA(window_handle, GWLP_USERDATA);
    if (!window)
        return DefWindowProc(window_handle, message, w_param, l_param);

    switch (message)
    {
    
    // since the callback can fire at any time, we use a polling stratgy in platform_frame
    // otherwise the values could change inbetween a frame and lead to weird behaviour
    #if 0
        case WM_DESTROY:
        {
            window->was_destroyed = true;
        } break;
    
        case WM_MOVE:
        case WM_SIZE:
        {
            win32_get_window_box(window);
        } break;
        */
        
        // NOTE:
        // WM_MOUSEMOVE and WM_MOUSELEAVE are not reliable in respect to order
        // so I'm not shure if focus mouse allways works
        
        case WM_MOUSEMOVE:
        {
            //if (!window->has_mouse_focus)
                //printf("window %x mouse enter\n", window);
                
            window->has_mouse_focus = true;
            
            //assert((!window->win32.platform->mouse.focus_window) || (window->win32.platform->mouse.focus_window == window));
            window->win32.platform->mouse.focus_window = window;
        
            // without this we don't get WM_MOUSELEAVE message
            TRACKMOUSEEVENT track_mouse_event;
            track_mouse_event.cbSize = sizeof(track_mouse_event);
            track_mouse_event.dwFlags = TME_LEAVE;
            track_mouse_event.hwndTrack = window_handle;
            TrackMouseEvent(&track_mouse_event);
        } break;
        
        case WM_MOUSELEAVE:
        {
            //printf("window %x mouse leave\n", window);
            
            window->has_mouse_focus = false;
            
            //assert(window->win32.platform->mouse.focus_window);
            window->win32.platform->mouse.focus_window = null;
        } break;
    #endif
    
        // improves XInputGetState performance
        // XInputGetState is slow if device is not connected
        case WM_DEVICECHANGE:
        {
            window->win32.platform->win32.check_gamepad_connections = true;
        } break;
        
        default:
            return DefWindowProcA(window_handle, message, w_param, l_param);
    }

    return 0;
}

xinput_signature_get_state(XInputGetStateStub)
{
    return ERROR_DEVICE_NOT_CONNECTED;
}

xinput_signature_get_capabilities(XInputGetCapabilitiesStub)
{
    return ERROR_DEVICE_NOT_CONNECTED;
}

void platform_init(platform_api *platform)
{
    *platform = {};
    // for debugging
    
#if 0

    // allways with console

    if (!AttachConsole(ATTACH_PARENT_PROCESS))
        AllocConsole();
    
    {
        // reopen stout handle as console window output
        freopen("CONOUT$","wb", stdout);
        // reopen stderr handle as console window output
        freopen("CONOUT$","wb", stderr);
    }
    
#else

    // only with console, if started from terminal

    if (AttachConsole(ATTACH_PARENT_PROCESS))
    {
        // reopen stout handle as console window output
        freopen("CONOUT$","wb", stdout);
        // reopen stderr handle as console window output
        freopen("CONOUT$","wb", stderr);
    }

#endif
    
    platform->arena_list_tail = &platform->arena_list;
    
    platform->win32.window_class_name = "My Window Class";
    platform->win32.instance = (HINSTANCE) GetModuleHandle(NULL);

    WNDCLASSA window_class = {0};
    window_class.lpfnWndProc = window_callback;
    window_class.hInstance = platform->win32.instance;
    window_class.hbrBackground = (HBRUSH)(COLOR_BACKGROUND);
    window_class.lpszClassName = platform->win32.window_class_name;
    window_class.style = CS_OWNDC;
    window_class.hCursor = LoadCursor(NULL, IDC_ARROW);
    
    RegisterClass(&window_class);
    
    // try different xinput dlls for xbox360 controller support
    {
        HMODULE xinput_dll = LoadLibraryA("xinput1_4.dll");
        
        if (!xinput_dll)
            xinput_dll = LoadLibraryA("xinput1_3.dll");
        
        if (!xinput_dll)
            xinput_dll = LoadLibraryA("xinput9_1_0.dll");
        
        xinput_function_get_state XInputGetState = null;
        xinput_function_get_capabilities XInputGetCapabilities;
        if (xinput_dll)
        {
            XInputGetState = (xinput_function_get_state) GetProcAddress(xinput_dll, "XInputGetState");
            
            XInputGetCapabilities = (xinput_function_get_capabilities) GetProcAddress(xinput_dll, "XInputGetCapabilities");
        }
        
        if (!XInputGetState)
        {
            XInputGetState = XInputGetStateStub;
            XInputGetCapabilities = XInputGetCapabilitiesStub;
        }
        
        platform->win32.XInputGetState = XInputGetState;
        platform->win32.XInputGetCapabilities = XInputGetCapabilities;
        platform->win32.check_gamepad_connections = true;
    }
    
    // for more granular sleep
    timeGetDevCaps(&platform->win32.timecaps, sizeof(platform->win32.timecaps));
    
    LARGE_INTEGER ticks_per_second;
    QueryPerformanceFrequency(&ticks_per_second);
    platform->win32.ticks_per_second = ticks_per_second.QuadPart;
    
    LARGE_INTEGER ticks;
    QueryPerformanceCounter(&ticks);
    platform->win32.last_time_ticks = ticks.QuadPart;
}

void platform_window_set_icon(platform_api *platform, platform_window *window, cstring icon_name = "icon.ico")
{
    auto icon = LoadIcon(platform->win32.instance, icon_name);
    require(icon);
    
    SetClassLongPtrA(window->win32.handle, GCLP_HICON, (LONG_PTR) icon);
}

void platform_window_init(platform_api *platform, platform_window *window, bool use_default_position = true)
{
    DWORD window_style = WS_OVERLAPPEDWINDOW;
    
    RECT client_rect;
    client_rect.left = 0;
    client_rect.right = client_rect.left + window->width;
    client_rect.top = 0;
    client_rect.bottom = client_rect.top + window->height;
    AdjustWindowRect(&client_rect, window_style, FALSE);
    
    s32 x = 0;
    s32 y = 0;
    if (use_default_position)
    {
        x = CW_USEDEFAULT;
        y = CW_USEDEFAULT;
    }
    
    window->win32.handle = CreateWindow(platform->win32.window_class_name, window->title, window_style, x, y, client_rect.right - client_rect.left, client_rect.bottom - client_rect.top, 0, 0, platform->win32.instance, 0);
    require(window->win32.handle != INVALID_HANDLE_VALUE);
    
    window->win32.device_context = GetDC(window->win32.handle);
    
    if (!use_default_position)
    {
        s32 x = window->x;
        s32 y = window->y;
        win32_get_window_box(window);
        
        SetWindowPos(window->win32.handle, null, x - window->x, window->y - y, 0, 0, SWP_NOSIZE | SWP_SHOWWINDOW);
        
        window->x = x;
        window->y = y;
    }
    else
    {
        ShowWindow(window->win32.handle, SW_SHOW);
        
        win32_get_window_box(window);
    }
    
    // try set default icon
    {
        auto icon = LoadIcon(platform->win32.instance, "icon.ico");
        if (icon)
            SetClassLongPtrA(window->win32.handle, GCLP_HICON, (LONG_PTR) icon);
    }
    
    // so we can reference the platform in the window callback
    // a global variable might be better
    window->win32.platform = platform;
    
    // handling this error is just a mess, not gonna do it!
    SetWindowLongPtrA(window->win32.handle, GWLP_USERDATA, (u64) window);
    
    // probably not needed (assumed to be false)
    window->has_mouse_focus = (window->win32.handle == platform->win32.focus_window_handle);
    
    // remember all windows
    assert(!window->win32.next && (platform->win32.first_window != window), "window was init multiple times");
    window->win32.next = platform->win32.first_window;
    platform->win32.first_window = window;
}

void platform_window_present(platform_api *platform, platform_window *window)
{
    require(!window->was_destroyed);
    SwapBuffers(window->win32.device_context);
    //window->was_resized = false;
}

static void button_update_event(platform_button *button, bool is_active, bool was_repeated = false)
{
    assert(is_active || !was_repeated, "no repeat messages for button release allowed");
    
    if (!was_repeated)
    {
        if (button->change_count == 31)
            button->change_count_overflow = true;
        
        button->change_count++;
    }
    
    button->is_active = is_active;
    button->was_repeated |= was_repeated;
    button->was_repeated &= is_active;
}

static void button_update_poll(platform_button *button, bool is_active, bool was_repeated = false)
{
    button->change_count = 0;
    button->change_count_overflow = false;
    button->was_repeated = false;

    // don't count transitions if nothing changed
    if (button->is_active != is_active)
        button_update_event(button, is_active, was_repeated);
}

static void button_advance(platform_button *button)
{
    button->change_count = 0;
    button->change_count_overflow = false;
    button->was_repeated = false;
}

static bool was_pressed(platform_button button)
{
    if (button.is_active)
        return button.change_count >= 1;
    else
        return button.change_count >= 2;
}

static bool was_released(platform_button button)
{
    if (button.is_active)
        return button.change_count >= 2;
    else
        return button.change_count >= 1;
}

static bool was_repeated(platform_button button)
{
    return button.was_repeated || was_pressed(button);
}

static bool key_was_pressed(platform_api *platform, u32 key)
{
    assert(key < carray_count(platform->keys));
    return was_pressed(platform->keys[key]);
}

static bool key_was_released(platform_api *platform, u32 key)
{
    assert(key < carray_count(platform->keys));
    return was_released(platform->keys[key]);
}

static bool key_is_active(platform_api *platform, u32 key)
{
    assert(key < carray_count(platform->keys));
    return platform->keys[key].is_active;
}

static bool key_was_repeated(platform_api *platform, u32 key)
{
    assert(key < carray_count(platform->keys));
    return was_repeated(platform->keys[key]);
}

#if 0

// from https://www.usb.org/sites/default/files/documents/hut1_12v2.pdf
// USB specification
enum
{
    usb_usage_page_generic_desktop = 1,
    usb_usage_page_joystick = 4,
    usb_usage_page_gamepad = 5,
};

void platform_win32_enable_raw_gamepads(HWND window_handle)
{
    RAWINPUTDEVICE raw_input_devices[2];
    
    // RIDEV_INPUTSINK
    
    raw_input_devices[0].usUsagePage = usb_usage_page_generic_desktop;
    raw_input_devices[0].usUsage     = usb_usage_page_joystick;
    raw_input_devices[0].dwFlags     = 0;
    raw_input_devices[0].hwndTarget  = window_handle;
    
    raw_input_devices[1].usUsagePage = usb_usage_page_generic_desktop;
    raw_input_devices[1].usUsage     = usb_usage_page_gamepad;
    raw_input_devices[1].dwFlags     = 0;
    raw_input_devices[1].hwndTarget  = window_handle;
    
    require( RegisterRawInputDevices(raw_input_devices, carray_count(raw_input_devices), sizeof(RAWINPUTDEVICE)) );
}

struct platform_win32_gamepad_info
{
    u32 vendor, product;
};

platform_win32_gamepad_info platform_win32_gamepad_playstation_4 = { 1356, 1476 };

enum platform_gamepad_model
{
    platform_gamepad_model_unknown,
    platform_gamepad_model_xbox_360,
    platform_gamepad_model_playstation_4,
};

void platform_win32_handle_raw_input(platform_api *platform, LPARAM l_param)
{
    //case WM_INPUT:
    auto handle = (HRAWINPUT) l_param;
                
    u32 byte_count;
    if (GetRawInputData(handle, RID_INPUT, null, &byte_count, sizeof(RAWINPUTHEADER)) != 0)
        return;
    
    if (!byte_count)
        return;
                
    RAWINPUT raw_input;
    GetRawInputData(handle, RID_INPUT, &raw_input, &byte_count, sizeof(raw_input.header));
                
    if (raw_input.header.dwType != RIM_TYPEHID)
        return;
                
    RID_DEVICE_INFO device_info;
    byte_count = sizeof(device_info);
    GetRawInputDeviceInfo(raw_input.header.hDevice, RIDI_DEVICEINFO, &device_info, &byte_count);
    
    platform_gamepad *gamepad = null;
    for (u32 i = XUSER_MAX_COUNT; i < carray_count(platform->gamepads); i++)
    {
        if (platform->gamepads[i].win32.device == raw_input.header.hDevice)
        {
            gamepad = &platform->gamepads[i];
            assert(gamepad->is_enabled);
            break;
        }
        // pick first disabled slot to place new gamepad in
        else if (!gamepad && !platform->gamepads[i].is_enabled)
        {
            gamepad = &platform->gamepads[i];
        }
    }
    
    // WARNING: we only support a set maximum controller count
    if (!gamepad)
        return;
    
    // is new gamepad
    if (!gamepad->enabled)
    {
        gamepad->enabled = true;
        
        if ((device_info.hid.dwVendorId == platform_win32_gamepad_playstation_4.vendor) && (device_info.hid.dwProductId == platform_win32_gamepad_playstation_4.product))
            gamepad->model = platform_gamepad_model_playstation_4;
        else
            gamepad->model = platform_gamepad_model_unknown;
            
        // GetRawInputDeviceInfo(raw_input.header.hDevice, RIDI_DEVICENAME, null, &byte_count);
        // GetRawInputDeviceInfo(raw_input.header.hDevice, RIDI_DEVICENAME, name.base, &byte_count);
    }
    
    u8 buffer[1024];
    auto previously_parsed_data = (PHIDP_PREPARSED_DATA) buffer;
    byte_count = carray_count(buffer);
    if (GetRawInputDeviceInfo(raw_input.header.hDevice, RIDI_PREPARSEDDATA, previously_parsed_data, &byte_count) != 0)
        return;
                
    HIDP_CAPS caps;
    if (HidP_GetCaps(previously_parsed_data, &caps) != HIDP_STATUS_SUCCESS)
        return;
                
    HIDP_BUTTON_CAPS button_caps[32];
    auto button_cap_count = caps.NumberInputButtonCaps;
                
    if (HidP_GetButtonCaps(HidP_Input, button_caps, &button_cap_count, previously_parsed_data) != HIDP_STATUS_SUCCESS)
        return;
                
    auto button_count = button_caps->Range.UsageMax - button_caps->Range.UsageMin + 1;
        
    // CONTINUE here!
                auto value_cap_count = caps.NumberInputValueCaps;
                auto value_caps = ALLOCATE_ARRAY_BASE(memory, HIDP_VALUE_CAPS, value_cap_count);
                defer { if (value_caps) free(memory, value_caps); };
                
                if (HidP_GetValueCaps(HidP_Input, value_caps, &value_cap_count, previously_parsed_data) != HIDP_STATUS_SUCCESS)
                    break;
                
                ULONG usage_count = button_count;
                auto usages = ALLOCATE_ARRAY_BASE(memory, USAGE, usage_count);
                defer { if (usages) free(memory, usages); };
                if (HidP_GetUsages(HidP_Input, button_caps->UsagePage, 0, usages, &usage_count, previously_parsed_data, (PCHAR)raw_input.data.hid.bRawData, raw_input.data.hid.dwSizeHid) != HIDP_STATUS_SUCCESS)
                    break;
                
                auto *message = ALLOCATE(transient_memory, Platform_Message_HID_Input);
                *message = {};
                message->kind = Platform_Message_Kind_HID_Input;
                message->device_id = (usize)raw_input.header.hDevice;
                
                message->button_states = ALLOCATE_ARRAY(transient_memory, u32, (usize)button_count);
                
                message->values = {};
                
                for (u32 i = 0; i < caps.NumberInputValueCaps; i++)
                {
                    if (!value_caps[i].IsRange)
                    {
                        //assert(value_caps[i].HasNull);
                        //assert(value_caps[i].IsAbsolute);
                        array_grow(transient_memory, &message->values);
                    }
                }
                
                if (message->button_states.count + message->values.count)
                    message->ids = ALLOCATE_ARRAY(transient_memory, u32, message->button_states.count + message->values.count);
                else
                    message->ids = {};
                
                reset(message->button_states.base, array_byte_count_of(message->button_states));
                for (u32 i = 0; i < usage_count; i++)
                    message->button_states[usages[i] - button_caps->Range.UsageMin] = true;
                
                u32 id_index = 0;
                for (u32 i = 0; i < button_count; i++)
                    message->ids[id_index++] = button_caps->Range.DataIndexMin + i;
                
                u32 value_index = 0;
                for (u32 i = 0; i < caps.NumberInputValueCaps; i++)
                {
                    if (!value_caps[i].IsRange)
                    {
                        ULONG raw_value;
                        if (HidP_GetUsageValue(HidP_Input, value_caps[i].UsagePage, 0, value_caps[i].NotRange.Usage, &raw_value, previously_parsed_data, (PCHAR)raw_input.data.hid.bRawData, raw_input.data.hid.dwSizeHid) != HIDP_STATUS_SUCCESS)
                            continue;
                        
                        message->values[value_index++] = ((f32)raw_value - value_caps[i].LogicalMin) / (value_caps[i].LogicalMax - value_caps[i].LogicalMin);
                        message->ids[id_index++] = value_caps[i].NotRange.DataIndex;
                    }
                }
                
                insert_tail(transient_memory, messages)->message = (Platform_Message *)message;
                
                if (gamepad)
                    win32_update_gamepad_from_raw_input(gamepad, *message);
            } break;
}
#endif

void platform_win32_gamepad_normalize_axis(platform_gamepad_stick *stick, s32 x, s32 y, s32 dead_zone)
{
    vec2 raw_direction = { (f32) x, (f32) y };

    for (u32 i = 0; i < 2; i++)
    {
        if (raw_direction[i] > 0)
            raw_direction[i] = raw_direction[i] / 32767.0f;
        else
            raw_direction[i] = raw_direction[i] / 32768.0f;
            
        assert((-1 <= raw_direction[i]) && (raw_direction[i] <= 1.0f));
    }
    
    f32 normalized_dead_zone = dead_zone / 32767.0f;
    
    vec2 direction = {};
    
    // use circular dead zone
#if 0
    f32 l = length(raw_direction);
    bool direction_is_active = (l > normalized_dead_zone);
    
    if (direction_is_active)
    {
        f32 normalized_l = l;
        if (normalized_l > 1.0f)
            normalized_l = 1.0f;
        
        // map [normalized_dead_zone, 1.0] to [0, 1]
        normalized_l = (normalized_l - normalized_dead_zone) / (1.0f - normalized_dead_zone);
        assert(normalized_l <= 1.0f);
        direction = raw_direction * (normalized_l / l);
    }
    
    // use box dead zone, allows for better snapping to main 4 directions
#else
    
    for (u32 i = 0; i < 2; i++)
    {
        direction[i] = raw_direction[i];
        
        if (direction[i] > normalized_dead_zone)
            direction[i] -= normalized_dead_zone;
        else if (direction[i] < -normalized_dead_zone)
            direction[i] += normalized_dead_zone;
        else
            direction[i] = 0;
            
        direction[i] = direction[i] / (1.0f - normalized_dead_zone);
    }
    
    f32 l = length(direction);
    bool direction_is_active = (l > 0.0f);
    if (l > 1.0f)
        direction = normalize(direction);

#endif
    
    stick->raw_direction = raw_direction;
    stick->direction     = direction;
    
    button_update_poll(&stick->direction_as_button, direction_is_active);
}

static u64 platform_milliseconds_counter(platform_api *platform)
{
    LARGE_INTEGER ticks;
    QueryPerformanceCounter(&ticks);
    
    return ticks.QuadPart;
}

static u64 platform_delta_milliseconds(platform_api *platform, u64 start, u64 end)
{
    // better to predevide ticks_per_second
    u64 result = (end - start) * 1000 / platform->win32.ticks_per_second;
    return result;
}


void win32_add_character(platform_api *platform, u32 utf32_code, bool was_repeated)
{
    if (platform->character_and_missed_count++ >= carray_count(platform->characters))
        return;
        
    platform_character *character = platform->characters + platform->character_count++;

    character->utf32_code         = utf32_code;
    character->was_repeated       = was_repeated;
    character->with_left_shift    = platform->keys[VK_LSHIFT].is_active;
    character->with_right_shift   = platform->keys[VK_RSHIFT].is_active;
    character->with_left_alt      = platform->keys[VK_LMENU].is_active;
    character->with_right_alt     = platform->keys[VK_RMENU].is_active;
    character->with_left_control  = platform->keys[VK_LCONTROL].is_active;
    character->with_right_control = platform->keys[VK_RCONTROL].is_active;
}

bool platform_frame(platform_api *platform)
{
    if (platform->do_quit)
        return false;

    for (u32 i = 0; i < carray_count(platform->keys); i++)
    {
        button_advance(&platform->keys[i]);
    }
    
    button_advance(&platform->mouse.left);
    button_advance(&platform->mouse.middle);
    button_advance(&platform->mouse.right);

    platform->character_and_missed_count = 0;
    platform->character_count = 0;
    
    platform->mouse.wheel_delta = 0;

    MSG msg;
    while (PeekMessage(&msg, NULL, 0, 0, PM_REMOVE))
    {
        switch (msg.message)
        {
            case WM_QUIT:
            {
                // so that the application can react to closing
                platform->do_quit = true;
                return true;
            } break;
            
            case WM_SYSKEYDOWN:
            case WM_KEYDOWN:
            {
                bool last_key_was_down = msg.lParam & (1 << 30);
                
                button_update_event(&platform->keys[msg.wParam], true, last_key_was_down);
                
                #if 0
                u32 code = -1;
                switch (msg.wParam)
                {
                    /*case VK_BACK:
                    {
                        code = Platform_Character_Backspace;
                    } break;*/
                    
                    case VK_TAB: {
                        code = Platform_Character_Tab;
                    } break;
                    
                    case VK_RETURN: {
                        code = Platform_Character_Return;
                    } break;
                    
                    case VK_ESCAPE: {
                        code = Platform_Character_Escape;
                    } break;
                    
                    case VK_RIGHT: {
                        code = Platform_Character_Right;
                    }break;
                    
                    case VK_UP: {
                        code = Platform_Character_Up;
                    } break;
                    
                    case VK_LEFT: {
                        code = Platform_Character_Left;
                    } break;
                    
                    case VK_DOWN: {
                        code = Platform_Character_Down;
                    } break;
                    
                    case VK_INSERT: {
                        code = Platform_Character_Insert;
                    } break;
                    
                    case VK_DELETE: {
                        code = Platform_Character_Delete;
                    } break;
                    
                    case VK_PRIOR: {
                        code = Platform_Character_Page_Up;
                    } break;
                    
                    case VK_NEXT: {
                        code = Platform_Character_Page_Down;
                    } break;
                    
                    case VK_HOME: {
                        code = Platform_Character_Begin;
                    } break;
                    
                    case VK_END: {
                        code = Platform_Character_End;
                    } break;
                    
                    default:
                    return false;
                }
                
                win32_add_character(platform, msg.wParam, (msg.lParam >> 30) & 1);
            #endif
                
            } break;
            
            case WM_SYSKEYUP:
            case WM_KEYUP:
            {
                button_update_event(&platform->keys[msg.wParam], false);
            };
            
            case WM_UNICHAR:
            case WM_CHAR:
            {
                // key was released
                if (msg.lParam & (1 << 31))
                    break;
                
                // win32 uses '\r' to indicate new line, we want '\n'
                if (msg.wParam == '\r')
                    msg.wParam = '\n';
                    
                win32_add_character(platform, msg.wParam, (msg.lParam >> 30) & 1);
            } break;
            
            case WM_MOUSEWHEEL:
            {
                platform->mouse.wheel_delta += GET_WHEEL_DELTA_WPARAM(msg.wParam) / WHEEL_DELTA;
            } break;
        }
    
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }
    
    POINT cursor;
    GetCursorPos(&cursor);
    
    MONITORINFO monitor_info = { sizeof(monitor_info) };
    GetMonitorInfo(MonitorFromPoint(cursor, MONITOR_DEFAULTTOPRIMARY), &monitor_info);
    
    platform->mouse.previous_display_x = platform->mouse.display_x;
    platform->mouse.previous_display_y = platform->mouse.display_y;
    
    platform->mouse.display_x = cursor.x;
    platform->mouse.display_y = monitor_info.rcMonitor.bottom - 1 - cursor.y;
    
    button_update_poll(&platform->mouse.left,   GetKeyState(VK_LBUTTON) & 0x8000);
    button_update_poll(&platform->mouse.middle, GetKeyState(VK_MBUTTON) & 0x8000);
    button_update_poll(&platform->mouse.right,  GetKeyState(VK_RBUTTON) & 0x8000);
    
    // handle gamepads
    
    if (platform->win32.check_gamepad_connections)
    {
        platform->win32.check_gamepad_connections = false;
        
        for (DWORD i = 0; i < XUSER_MAX_COUNT; ++i)
        {
            XINPUT_CAPABILITIES caps;
            platform->gamepads[i].is_enabled = (platform->win32.XInputGetCapabilities(i, XINPUT_FLAG_GAMEPAD,
                                                                                        &caps) == ERROR_SUCCESS);
        }
        
        for (u32 i = XUSER_MAX_COUNT; i < carray_count(platform->gamepads); i++)
            platform->gamepads[i].is_enabled = false;
    }
    
    for (DWORD i = 0; i < XUSER_MAX_COUNT; ++i)
    {
        if (!platform->gamepads[i].is_enabled)
            continue;
        
        XINPUT_STATE state = {};
        DWORD result = platform->win32.XInputGetState(i, &state);
        
        auto gamepad = &platform->gamepads[i];
        
        if (result != ERROR_SUCCESS)
        {
            gamepad->is_enabled = false;
            continue;
        }
        
        platform_win32_gamepad_normalize_axis(&gamepad->left_stick, state.Gamepad.sThumbLX, state.Gamepad.sThumbLY, XINPUT_GAMEPAD_LEFT_THUMB_DEADZONE);
        platform_win32_gamepad_normalize_axis(&gamepad->right_stick, state.Gamepad.sThumbRX, state.Gamepad.sThumbRY, XINPUT_GAMEPAD_RIGHT_THUMB_DEADZONE);
        
        //normalize_sticks(gamepad, dead_zone);
        
        gamepad->left_trigger.raw_value  = state.Gamepad.bLeftTrigger / 255.0f;
        gamepad->left_trigger.value = 0.0f;
        if (state.Gamepad.bLeftTrigger >= XINPUT_GAMEPAD_TRIGGER_THRESHOLD)
            gamepad->left_trigger.value = (state.Gamepad.bLeftTrigger - XINPUT_GAMEPAD_TRIGGER_THRESHOLD) / (f32) (255 - XINPUT_GAMEPAD_TRIGGER_THRESHOLD);
        
        gamepad->right_trigger.raw_value = state.Gamepad.bRightTrigger / 255.0f;
        gamepad->right_trigger.value = 0.0f;
        if (state.Gamepad.bRightTrigger >= XINPUT_GAMEPAD_TRIGGER_THRESHOLD)
            gamepad->right_trigger.value = (state.Gamepad.bRightTrigger - XINPUT_GAMEPAD_TRIGGER_THRESHOLD) / (f32) (255 - XINPUT_GAMEPAD_TRIGGER_THRESHOLD);
        
        button_update_poll(&gamepad->left_trigger.button, (gamepad->left_trigger.value != 0));
        button_update_poll(&gamepad->right_trigger.button, (gamepad->right_trigger.value != 0));
        
        button_update_poll(&gamepad->dpad.up, state.Gamepad.wButtons & XINPUT_GAMEPAD_DPAD_UP);
        button_update_poll(&gamepad->dpad.down, state.Gamepad.wButtons & XINPUT_GAMEPAD_DPAD_DOWN);
        button_update_poll(&gamepad->dpad.right, state.Gamepad.wButtons & XINPUT_GAMEPAD_DPAD_RIGHT);
        button_update_poll(&gamepad->dpad.left, state.Gamepad.wButtons & XINPUT_GAMEPAD_DPAD_LEFT);
        
        button_update_poll(&gamepad->action.down, state.Gamepad.wButtons & XINPUT_GAMEPAD_A);
        button_update_poll(&gamepad->action.right, state.Gamepad.wButtons & XINPUT_GAMEPAD_B);
        button_update_poll(&gamepad->action.left, state.Gamepad.wButtons & XINPUT_GAMEPAD_X);
        button_update_poll(&gamepad->action.up, state.Gamepad.wButtons & XINPUT_GAMEPAD_Y);
        
        button_update_poll(&gamepad->left_shoulder, state.Gamepad.wButtons & XINPUT_GAMEPAD_LEFT_SHOULDER);
        button_update_poll(&gamepad->right_shoulder, state.Gamepad.wButtons & XINPUT_GAMEPAD_RIGHT_SHOULDER);
        
        button_update_poll(&gamepad->left_stick.button, state.Gamepad.wButtons & XINPUT_GAMEPAD_LEFT_THUMB);
        button_update_poll(&gamepad->right_stick.button, state.Gamepad.wButtons & XINPUT_GAMEPAD_RIGHT_THUMB);
        
        button_update_poll(&gamepad->select, state.Gamepad.wButtons & XINPUT_GAMEPAD_BACK);
        button_update_poll(&gamepad->start, state.Gamepad.wButtons & XINPUT_GAMEPAD_START);
    }
    
    // we poll these, so the the values stay the same inbetween a frame
    {
        platform->win32.focus_window_handle = GetForegroundWindow();
    
        auto previous_next = &platform->win32.first_window;
        for (auto window = platform->win32.first_window; window; )
        {
            window->has_mouse_focus = (window->win32.handle == platform->win32.focus_window_handle);
            window->was_destroyed   = !IsWindow(window->win32.handle);
            
            if (window->was_destroyed)
            {
                *previous_next = window->win32.next;
                window->win32.next = null;
                window = *previous_next;
            }
            else
            {
                win32_get_window_box(window);
                
                previous_next = &window->win32.next;
                window = window->win32.next;
            }
        }
    }
    
    u64 time_ticks = platform_milliseconds_counter(platform);
    platform->delta_seconds = (time_ticks - platform->win32.last_time_ticks) / (f32) platform->win32.ticks_per_second;
    platform->win32.last_time_ticks = time_ticks;
    
    return true;
}

platform_file_info platform_get_file_info(platform_api *platform, cstring file_path)
{
    WIN32_FILE_ATTRIBUTE_DATA data;
    BOOL ok = GetFileAttributesExA(file_path, GetFileExInfoStandard, &data);
    
    if (!ok)
        return {};
    
    u64 byte_count = (((u64) data.nFileSizeHigh) << 32) | data.nFileSizeLow;
    
    u64 write_timestamp = (((u64) data.ftLastWriteTime.dwHighDateTime) << 32) | (u64) data.ftLastWriteTime.dwLowDateTime;
    
    platform_file_info result;
    result.ok = true;
    result.byte_count = byte_count;
    result.write_timestamp = write_timestamp;
    
    return result;
}

bool platform_read_entire_file(u8_array memory, platform_api *platform, cstring file_path)
{
    auto file_info = platform_get_file_info(platform, file_path);
    assert(file_info.ok && (file_info.byte_count == memory.count));

    HANDLE file_handle = CreateFileA(file_path, GENERIC_READ, FILE_SHARE_READ, null, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, null);
    
    // might be written to
    if (file_handle == INVALID_HANDLE_VALUE)
        return false;
    
    // we can only read in ~4gb chunks
    while (memory.count)
    {
        DWORD byte_count;
        
        // has higher bits set
        if (memory.count >> 32) 
            byte_count = 0xFFFFFFFF;
        else
            byte_count = memory.count;
        
        DWORD read_byte_count;
        auto ok = ReadFile(file_handle, memory.base, byte_count, &read_byte_count, null);
        assert(ok && (byte_count == read_byte_count));
        
        memory.base  += byte_count;
        memory.count -= byte_count;
    }
    
    CloseHandle(file_handle);
    
    return true;
}

void platform_write_entire_file(platform_api *platform, cstring file_path, u8_array memory)
{
    HANDLE file_handle = CreateFileA(file_path, GENERIC_WRITE, 0, null, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, null);
    assert(file_handle != INVALID_HANDLE_VALUE);
    
    while (memory.count)
    {
        DWORD byte_count;
        // has higher bits set
        if (memory.count >> 32) 
            byte_count = 0xFFFFFFFF;
        else
            byte_count = memory.count;
        
        DWORD write_byte_count;
        auto ok = WriteFile(file_handle, memory.base, byte_count, &write_byte_count, null);
        assert(ok && (byte_count == write_byte_count));
        
        memory.base  += byte_count;
        memory.count -= byte_count;
    }
    
    CloseHandle(file_handle);
}

u8_array platform_allocate_bytes(platform_api *platform, usize byte_count)
{
    usize page_alignment_mask = 4095;
    
    u8_array memory;
    memory.count = (byte_count + page_alignment_mask) & ~page_alignment_mask;
    memory.base  = (u8 *) VirtualAlloc(null, memory.count, MEM_COMMIT, PAGE_READWRITE);
    require(memory.base, "out of memory"); // this will never trigger on x64
    
    return memory;
}

void platform_free_bytes(platform_api *platform, u8 *base)
{
    require( VirtualFree((void *) base, 0, MEM_RELEASE) );
}

struct platform_dynamic_library
{
    u64 write_timestamp;
    
    struct
    {
        HMODULE handle;
    } win32;
};

#if defined PLATFORM_HOT_CODE_RELOADING
    #define platform_export extern "C" __declspec(dllexport)
#else
    #define platform_export
#endif

typedef u8 *platform_library_pointer;

platform_dynamic_library platform_load_dynamic_library(platform_api *platform, cstring name)
{
    platform_dynamic_library lib = {};
    lib.win32.handle = LoadLibraryA(name);
    
    auto info = platform_get_file_info(platform, name);
    assert(!lib.win32.handle || info.ok);
    lib.write_timestamp = info.write_timestamp;
    
    return lib;
}

void platform_release_dynamic_library(platform_api *platform, platform_dynamic_library *library)
{
    assert(library->win32.handle);
    
    FreeLibrary(library->win32.handle);
    *library = {};
}

#define platform_load_pointer(platform, library, type, name) ( (type) platform_load_function_pointer(platform, library, name) )

platform_library_pointer platform_load_library_pointer(platform_api *platform, platform_dynamic_library library, cstring name)
{
    assert(library.win32.handle);
    
    platform_library_pointer result = (platform_library_pointer) GetProcAddress(library.win32.handle, name);
    return result;
}

bool platform_load_library_pointers(platform_api *platform, platform_dynamic_library library, u32 pointer_count, platform_library_pointer **pointers, cstring *pointer_names)
{
    assert(library.win32.handle);
    
    bool ok = true;
    for (u32 i = 0; i < pointer_count; i++)
    {
        *pointers[i] = platform_load_library_pointer(platform, library, pointer_names[i]);
        ok &= (*pointers[i] != null);
    }
    
    return ok;
}

bool platform_reload_dynamic_library(platform_api *platform, platform_dynamic_library *library, cstring filepath, cstring copy_filepath, u32 pointer_count, platform_library_pointer **pointers, cstring *pointer_names)
{
    auto info = platform_get_file_info(platform, filepath);
    if (library->win32.handle && (info.write_timestamp == library->write_timestamp))
        return false;
    
    // test load new library
    {
        auto test_library = platform_load_dynamic_library(platform, filepath);
        
        // not ready for loading
        if (!test_library.win32.handle)
            return false;
        
        bool ok = platform_load_library_pointers(platform, test_library, pointer_count, pointers, pointer_names);
        
        platform_release_dynamic_library(platform, &test_library);
        
        if (!ok)
            return false;
    }
    
    if (library->win32.handle)
        platform_release_dynamic_library(platform, library);

    // copy and load copy
    if (!CopyFile(filepath, copy_filepath, false))
        return false;
    
    *library = platform_load_dynamic_library(platform, copy_filepath);
    
    bool ok = platform_load_library_pointers(platform, *library, pointer_count, pointers, pointer_names);
    require(ok);

    return true;
}

u8_array platform_read_embedded_file(platform_api *platform, cstring filename, platform_dynamic_library *library = null)
{
    HMODULE module = null; // exe
    
    // load from .dll
    if (library)
        module = library->win32.handle;
    
    HRSRC resource = FindResourceA(module, filename, RT_RCDATA);
    if (!resource)
        return {};
    
    HGLOBAL data_handle = LoadResource(module, resource);
    require(data_handle);
    
    u8_array data;
    data.base = (u8 *) LockResource(data_handle);
    require(data.base);
    
    data.count = (usize) SizeofResource(module, resource);
    require(data.count);
    
    // no need to unlock data ..
    
    return data;
}

// default arena byte_count is 1gb, note that we expect the OS to only allocate as much as is in use
// this should be fine for x64 win32
// needs to be passed by pointer, since we want the memory location, to list all arenas
void platform_allocate_arena(memory_arena *memory, platform_api *platform, usize byte_count = 1 << 25)
{
    assert(!memory->base);
    *memory = {};
    
    u8_array buffer = platform_allocate_bytes(platform, byte_count);
    memory->byte_count = buffer.count;
    memory->base       = buffer.base;
    
    *platform->arena_list_tail = memory;
    platform->arena_list_tail  = &memory->next;
}