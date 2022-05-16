module gl;

import platform;

def gl_api struct
{
    is_version_3_3 b8;
    
    // win32 specific
    win32_context             HGLRC;
    win32_init_window_handle  HWND;
    win32_init_device_context HDC;
}

def gl_init func(gl gl_api ref; platform platform_api ref)
{
    var window_class WNDCLASSA;
    window_class.hInstance     = platform.win32_instance;
    window_class.lpfnWndProc   = DefWindowProc;
    window_class.hbrBackground = COLOR_BACKGROUND cast(HBRUSH);
    window_class.lpszClassName = "gl init dummy window class";
    window_class.style         = CS_OWNDC;
    window_class.hCursor       = LoadCursor(NULL, IDC_ARROW);
    platform_require(RegisterClass(window_class ref));

    var window_handle HWND = CreateWindow(platform.window_class_name, "gl init dummy window", WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, 100, 100, null, null, platform.win32_instance, 0);
    platform_require(window_handle is_not INVALID_HANDLE_VALUE);

    var device_context HDC = GetDC(window_handle);
    platform_require(device_context);
    
    gl_win32_window_init_1(device_context);
    
    var gl_context HGLRC = wglCreateContext(device_context);
    platform_require(gl_context);
    
    platform_require(wglMakeCurrent(device_context, gl_context));
    
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
    
    var pixel_format = ChoosePixelFormat(device_context, pixel_format_descriptor ref);
    platform_require(pixel_format);
    
    platform_require(SetPixelFormat(device_context, pixel_format, pixel_format_descriptor ref));
}

//def gl_win32_window_init_33 func(device_context HDC)
//{
//    var pixel_format_attributes s32[] =
//    {
//        WGL_DRAW_TO_WINDOW_ARB; GL_TRUE;
//        WGL_SUPPORT_OPENGL_ARB; GL_TRUE;
//        WGL_DOUBLE_BUFFER_ARB;  GL_TRUE;
//        WGL_PIXEL_TYPE_ARB; WGL_TYPE_RGBA_ARB;
//        WGL_COLOR_BITS_ARB; 24;
//        WGL_DEPTH_BITS_ARB; 24;
//        WGL_STENCIL_BITS_ARB; 8;
//        
//        // multi sample anti aliasing
//        WGL_SAMPLE_BUFFERS_ARB; GL_TRUE; // Number of buffers (must be 1 at time of writing)
//        WGL_SAMPLES_ARB; 1; // Number of samples
//        
//        0 // end
//    };
//    
//    var pixel_format s32;
//    var pixel_format_count u32;
//    platform_require(wglChoosePixelFormatARB(device_context, pixel_format_attributes.base, null, 1, pixel_format ref, pixel_format_count ref));
//    platform_require(SetPixelFormat(device_context, pixel_format, null));
//}
