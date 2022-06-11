module gl;

import platform;
import platform_win32;
import gl_win32;

def gl_api struct
{
    is_version_3_3 b8;
    
    // win32 specific
    win32_context             HGLRC;
    win32_init_window_handle  HWND;
    win32_init_device_context HDC;
}

def gl_init func(gl gl_api ref; platform platform_api ref; backwards_compatible b8 = false)
{
    var window_class WNDCLASSA;
    window_class.hInstance     = platform.win32_instance;
    window_class.lpfnWndProc   = DefWindowProc;
    window_class.hbrBackground = COLOR_BACKGROUND cast(HBRUSH);
    window_class.lpszClassName = "gl dummy window class";
    window_class.style         = CS_OWNDC;
    window_class.hCursor       = LoadCursor(NULL, IDC_ARROW);
    platform_require(RegisterClassA(window_class ref));

    var window_handle HWND = CreateWindowA(window_class.lpszClassName, "gl dummy window", WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, 128, 128, null, null, window_class.hInstance, 0);
    platform_require(window_handle is_not null);

    var device_context HDC = GetDC(window_handle);
    platform_require(device_context is_not null);
    
    gl_win32_window_init_1(device_context);
    
    var gl_context HGLRC = wglCreateContext(device_context);
    platform_require(gl_context is_not null);
    
    platform_require(wglMakeCurrent(device_context, gl_context));
    
    wglChoosePixelFormatARB    = wglGetProcAddress("wglChoosePixelFormatARB")    cast(wglChoosePixelFormatARB_signature);
    wglCreateContextAttribsARB = wglGetProcAddress("wglCreateContextAttribsARB") cast(wglCreateContextAttribsARB_signature);
    
    if wglChoosePixelFormatARB and wglCreateContextAttribsARB
    {
        platform_require(wglMakeCurrent(null, null));
    
        var gl_3_3_window_handle HWND = CreateWindowA(window_class.lpszClassName, "gl dummy window", WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, 128, 128, null, null, window_class.hInstance, 0);
        platform_require(gl_3_3_window_handle is_not INVALID_HANDLE_VALUE);

        var gl_3_3_device_context HDC = GetDC(gl_3_3_window_handle);
        platform_require(gl_3_3_device_context is_not null);
        
        gl_win32_window_init_3_3(gl_3_3_device_context);
        
        var context_attributes s32[] = {
                WGL_CONTEXT_MAJOR_VERSION_ARB; 3;
                WGL_CONTEXT_MINOR_VERSION_ARB; 3;
                WGL_CONTEXT_FLAGS_ARB;         WGL_CONTEXT_DEBUG_BIT_ARB;
                WGL_CONTEXT_PROFILE_MASK_ARB;  WGL_CONTEXT_CORE_PROFILE_BIT_ARB;
                0
            };
        
        if backwards_compatible
            { context_attributes[7] = WGL_CONTEXT_COMPATIBILITY_PROFILE_BIT_ARB; }
            
        var gl_3_3_context HGLRC = wglCreateContextAttribsARB(gl_3_3_device_context, null, context_attributes[0] ref);
        
        if gl_3_3_context
        {
            platform_require(wglDeleteContext(gl_context));
            platform_require(ReleaseDC(window_handle, device_context));
            platform_require(DestroyWindow(window_handle));
            
            gl_context     = gl_3_3_context;
            device_context = gl_3_3_device_context;
            window_handle  = gl_3_3_window_handle;
            
            gl.is_version_3_3 = true;
        }
        else
        {
            platform_require(ReleaseDC(gl_3_3_window_handle, gl_3_3_device_context));
            platform_require(DestroyWindow(gl_3_3_window_handle));
        }
        
        platform_require(wglMakeCurrent(device_context, gl_context));
    }
    
    gl_init_functions();
    
    gl.win32_context             = gl_context;
    gl.win32_init_window_handle  = window_handle;
    gl.win32_init_device_context = device_context;
    
    if glDebugMessageCallback
    {
        glEnable(GL_DEBUG_OUTPUT);
        glEnable(GL_DEBUG_OUTPUT_SYNCHRONOUS); // message will be generated in function call scope
        glDebugMessageCallback(gl_debug_message_callback, null);
    }
}

def gl_window_init func(platform platform_api ref; gl gl_api ref; window platform_window ref)
{
    if gl.is_version_3_3
    {
        gl_win32_window_init_3_3(window.device_context);
    }
    else
    {
        gl_win32_window_init_1(window.device_context);
    }
    
    platform_require(wglMakeCurrent(window.device_context, gl.win32_context));
}

def gl_debug_message_callback func GLDEBUGPROC
{
    
}

def gl_win32_window_init_1 func(device_context HDC)
{
    var pixel_format_descriptor PIXELFORMATDESCRIPTOR;
    pixel_format_descriptor.nSize        = sizeof(PIXELFORMATDESCRIPTOR);
    pixel_format_descriptor.nVersion     = 1; // allways 1
    pixel_format_descriptor.dwFlags      = PFD_DRAW_TO_WINDOW bit_or PFD_SUPPORT_OPENGL bit_or PFD_DOUBLEBUFFER;
    pixel_format_descriptor.iPixelType   = PFD_TYPE_RGBA;
    pixel_format_descriptor.cColorBits   = 24; //32;
    pixel_format_descriptor.cDepthBits   = 24;
    pixel_format_descriptor.cStencilBits = 8;
    pixel_format_descriptor.iLayerType   = PFD_MAIN_PLANE;
    
    var pixel_format s32 = ChoosePixelFormat(device_context, pixel_format_descriptor ref);
    platform_require(pixel_format is_not 0);
    
    platform_require(SetPixelFormat(device_context, pixel_format, pixel_format_descriptor ref));
}

def gl_win32_window_init_3_3 func(device_context HDC)
{
    var pixel_format_attributes s32[] =
    {
        WGL_DRAW_TO_WINDOW_ARB; GL_TRUE;
        WGL_SUPPORT_OPENGL_ARB; GL_TRUE;
        WGL_DOUBLE_BUFFER_ARB;  GL_TRUE;
        WGL_PIXEL_TYPE_ARB; WGL_TYPE_RGBA_ARB;
        WGL_COLOR_BITS_ARB; 24;
        WGL_DEPTH_BITS_ARB; 24;
        WGL_STENCIL_BITS_ARB; 8;
        
        // multi sample anti aliasing
        // WGL_SAMPLE_BUFFERS_ARB; GL_TRUE; // Number of buffers (must be 1 at time of writing)
        // WGL_SAMPLES_ARB; 1;  // Number of samples
        
        0 // end
    };
    
    var pixel_format s32;
    var pixel_format_count u32;
    platform_require(wglChoosePixelFormatARB(device_context, pixel_format_attributes[0] ref, null, 1, pixel_format ref, pixel_format_count ref));
    platform_require(SetPixelFormat(device_context, pixel_format, null));
}
