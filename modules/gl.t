module gl;

import platform;
import platform_win32;
import string;

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
    window_class.lpfnWndProc   = get_function_reference(DefWindowProcA WNDPROC);
    window_class.hbrBackground = COLOR_BACKGROUND cast(usize) cast(HBRUSH);
    window_class.lpszClassName = as_cstring("gl dummy window class\0");
    window_class.style         = CS_OWNDC;
    window_class.hCursor       = LoadCursorA(null, IDC_ARROW);
    platform_require(RegisterClassA(window_class ref));

    var window_handle = CreateWindowExA(0, window_class.lpszClassName, as_cstring("gl dummy window\0"), WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, 128, 128, null, null, window_class.hInstance, null);
    platform_require(window_handle is_not null);

    var device_context = GetDC(window_handle);
    platform_require(device_context is_not null);
    
    gl_win32_window_init_1(device_context);
    
    var gl_context = wglCreateContext(device_context);
    platform_require(gl_context is_not null);
    
    platform_require(wglMakeCurrent(device_context, gl_context));
    
    gl_load_bindings();
    
    if wglChoosePixelFormatARB and wglCreateContextAttribsARB
    {
        platform_require(wglMakeCurrent(null, null));
    
        var gl_3_3_window_handle = CreateWindowExA(0, window_class.lpszClassName, as_cstring("gl dummy window\0"), WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, 128, 128, null, null, window_class.hInstance, null);
        platform_require(gl_3_3_window_handle is_not INVALID_HANDLE_VALUE);

        var gl_3_3_device_context = GetDC(gl_3_3_window_handle);
        platform_require(gl_3_3_device_context is_not null);
        
        gl_win32_window_init_3_3(gl_3_3_device_context);
        
        var context_attributes = type (u32[])
        [
            WGL_CONTEXT_MAJOR_VERSION_ARB; 3;
            WGL_CONTEXT_MINOR_VERSION_ARB; 3;
            WGL_CONTEXT_FLAGS_ARB;         WGL_CONTEXT_DEBUG_BIT_ARB;
            WGL_CONTEXT_PROFILE_MASK_ARB;  WGL_CONTEXT_CORE_PROFILE_BIT_ARB;
            0
        ];
        
        if backwards_compatible
            { context_attributes[7] = WGL_CONTEXT_COMPATIBILITY_PROFILE_BIT_ARB; }
            
        var gl_3_3_context = wglCreateContextAttribsARB(gl_3_3_device_context, null, context_attributes[0] ref cast(s32 ref));
        
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
    
    gl.win32_context             = gl_context;
    gl.win32_init_window_handle  = window_handle;
    gl.win32_init_device_context = device_context;
    
    if glDebugMessageCallback
    {
        glEnable(GL_DEBUG_OUTPUT);
        glEnable(GL_DEBUG_OUTPUT_SYNCHRONOUS); // message will be generated in function call scope
        glDebugMessageCallback(get_function_reference(gl_debug_message_callback GLDEBUGPROC), null);
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

def gl_window_present func(platform platform_api ref; gl gl_api ref; window platform_window ref)
{
    SwapBuffers(window.device_context);
}

def gl_debug_message_callback func GLDEBUGPROC
{
    
}

def gl_win32_window_init_1 func(device_context HDC)
{
    var pixel_format_descriptor PIXELFORMATDESCRIPTOR;
    pixel_format_descriptor.nSize        = type_byte_count(type_of(pixel_format_descriptor)) cast(u16);
    pixel_format_descriptor.nVersion     = 1; // allways 1
    pixel_format_descriptor.dwFlags      = PFD_DRAW_TO_WINDOW bit_or PFD_SUPPORT_OPENGL bit_or PFD_DOUBLEBUFFER;
    pixel_format_descriptor.iPixelType   = PFD_TYPE_RGBA;
    pixel_format_descriptor.cColorBits   = 24; //32;
    pixel_format_descriptor.cDepthBits   = 24;
    pixel_format_descriptor.cStencilBits = 8;
    pixel_format_descriptor.iLayerType   = PFD_MAIN_PLANE;
    
    var pixel_format = ChoosePixelFormat(device_context, pixel_format_descriptor ref);
    platform_require(pixel_format is_not 0);
    platform_require(SetPixelFormat(device_context, pixel_format, pixel_format_descriptor ref));
}

def gl_win32_window_init_3_3 func(device_context HDC)
{
    var pixel_format_attributes = type(u32[])
    [
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
    ];
    
    var pixel_format s32;
    var pixel_format_count u32;
    platform_require(wglChoosePixelFormatARB(device_context, pixel_format_attributes[0] ref cast(s32 ref), null, 1, pixel_format ref, pixel_format_count ref));
    platform_require(SetPixelFormat(device_context, pixel_format, null));
}

def create_shader_object func(gl gl_api ref; is_fragment_shader b8; source string; name string) (shader_object u32)
{
    var shader_kind_map = type(GLuint[])
    [
        GL_VERTEX_SHADER;
        GL_FRAGMENT_SHADER
    ];

    var gl_shader_kind = shader_kind_map[is_fragment_shader];
    var shader_object = glCreateShader(gl_shader_kind);
    
    var source_byte_count = source.count cast(s32);
    glShaderSource(shader_object, 1, source.base ref, source_byte_count ref);
    
    glCompileShader(shader_object);
    
    var is_compiled GLint;
    glGetShaderiv(shader_object, GL_COMPILE_STATUS, is_compiled ref);
    if is_compiled is GL_FALSE
    {
        if not is_fragment_shader
        { 
            print("GLSL Compile Error: could not compile vertex shader '"); print(source); print("'\n");
        }
        else
        { 
            print("GLSL Compile Error: could not compile fragment shader '"); print(source); print("'\n");
        }
        
        var message_buffer u8[4096];
        var info_length GLint;
        glGetShaderiv(shader_object, GL_INFO_LOG_LENGTH, info_length ref);
        
        if info_length > message_buffer.count
            { info_length = message_buffer.count; }
        
        glGetShaderInfoLog(shader_object, info_length, info_length ref cast(GLsizei ref), message_buffer.base cast(GLchar ref));
        var message = type(string) { info_length cast(usize); message_buffer.base };
        print(message); print("\n");
        
        glDeleteShader(shader_object);
        return 0;
    }
    
    return shader_object;
}

def create_program_begin func(gl gl_api ref) (program_object u32)
{
    var program_object = glCreateProgram();
    return program_object;
}

def create_program_add_shader func(gl gl_api ref; program_object u32; shader_object u32)
{
    assert(program_object);
    assert(shader_object);
    
    glAttachShader(program_object, shader_object);
}

def create_program_bind_attribute func(gl gl_api ref; program_object u32; index u32; name string)
{
    assert(program_object);
    
    var name_buffer u8[256];
    sprintf_s(name_buffer.base cast(cstring), name_buffer.count cast(s32), "%.*s\0".base cast(cstring), name.count cast(s32), name.base cast(cstring));
    
    glBindAttribLocation(program_object, index, name_buffer.base cast(GLchar ref));
}

def create_program_end func(gl gl_api ref; program_object u32) (program_object u32)
{
    assert(program_object);
    
    glLinkProgram(program_object);
        
    var is_linked GLint;
    glGetProgramiv(program_object, GL_LINK_STATUS, is_linked ref);
    if not is_linked
    {
        print("GLSL Error: Could not link gl program:\n\n");
    
        var message_buffer u8[4096];
        var info_length GLint;
        glGetProgramiv(program_object, GL_INFO_LOG_LENGTH, info_length ref);
        
        if info_length > message_buffer.count
            { info_length = message_buffer.count; }
        
        glGetProgramInfoLog(program_object, info_length, info_length ref cast(GLsizei ref), message_buffer.base cast(GLchar ref));
        var message = type(string) { info_length cast(usize); message_buffer.base };
        print(message); print("\n");
        
        glDeleteProgram(program_object);
        
        return 0;
    }
    
    return program_object;
}

def starts_with func(text string; prefix string) (result b8)
{
    if text.count < prefix.count
        { return false; }
        
    loop var i; prefix.count
    {
        if text[i] is_not prefix[i]
            { return false; }
    }
    
    return true;
}

// if we compile with minimal dependencies, this list will only include gl calls, that are actually used
def gl_load_bindings func()
{
    loop var i; lang_global_variables.count
    {
        var variable = lang_global_variables[i];
        if ((variable.type.base_type.) is lang_type_info_type.function) and not variable.type.indirection_count and starts_with(variable.name, "gl") or starts_with(variable.name, "wgl")
        {
            // wglGetProcAddress expects 0-terminated string
            var buffer u8[256];
            sprintf_s(buffer.base cast(cstring), buffer.count cast(s32), "%.*s\0".base cast(cstring), variable.name.count cast(s32), variable.name.base cast(cstring));
            
            // cast to u8 ref ref, since we know, they are function pointers
            variable.base cast(u8 ref ref) . = wglGetProcAddress(buffer.base cast(cstring));
        }
    }
}
