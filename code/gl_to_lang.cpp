
#include "utf8_string.h"

struct parsed_type
{
    string name;
    u32 indirection_count;
};

bool add_unique(string_buffer *strings, string text)
{
    for (usize i = 0; i < strings->count; i++)
    {
        if (strings->base[i] == text)
            return false;
    }

    resize_buffer(strings, strings->count + 1);
    strings->base[strings->count - 1] = text;
    return true;
}

bool try_skip_keyword(string *iterator, string keyword)
{
    auto backup = *iterator;
    auto name = skip_name(iterator);
    if (name == keyword)
    {
        skip_white(iterator);
        
        return true;
    }
    else
    {
        *iterator = backup;
        
        return false;
    }
}

parsed_type skip_type(string *iterator)
{
    parsed_type result = {};
    
    try_skip_keyword(iterator, s("const"));
    try_skip_keyword(iterator, s("CONST")); // since windows is DUMB!!! #define CONST const
    
    try_skip_keyword(iterator, s("struct"));
    
    result.name = skip_name(iterator);
    while ((result.name == s("unsigned")) || (result.name == s("signed")) || (result.name == s("long")))
    {
        auto name = skip_name(iterator);
        result.name.count = name.base + name.count - result.name.base;
    }
    
    string c_to_lang_types[][2] =
    {
        //{ s("void"),               s("u8") },
        
        { s("char"),   s("u8") },
        { s("short"),  s("s16") },
        { s("int"),    s("s32") },
        { s("long"),   s("s32") },
        { s("float"),  s("f32") },
        { s("double"), s("f64") },
        
        { s("unsigned long"),      s("u32") },
        
        { s("unsigned char"),      s("u8") },
        { s("unsigned short"),     s("u16") },
        { s("unsigned int"),       s("u32") },
        { s("unsigned long long"), s("u64") },
        //{ s("size_t"),             s("usize") },
        
        { s("signed char"),      s("s8") },
        { s("signed short"),     s("s16") },
        { s("signed int"),       s("s32") },
        { s("signed long long"), s("s64") },
        
        // thank you khronos, that was completely useful gg
        { s("khronos_uint8_t"),  s("u8") },
        { s("khronos_uint16_t"), s("u16") },
        { s("khronos_uint32_t"), s("u32") },
        { s("khronos_uint64_t"), s("u64") },
        //{ s("khronos_size_t"),  s("usize") },
        
        { s("khronos_int8_t"),  s("s8") },
        { s("khronos_int16_t"), s("s16") },
        { s("khronos_int32_t"), s("s32") },
        { s("khronos_int64_t"), s("s64") },
        { s("khronos_ssize_t"), s("ssize") },
        
        { s("__GLsync"), s("u8") },
    };
    
    for (u32 i = 0; i < carray_count(c_to_lang_types); i++)
    {
        if (c_to_lang_types[i][0] == result.name)
        {
            result.name = c_to_lang_types[i][1];
            break;
        }
    }
    
    // thank you khronos, that was completely useful gg
    if (result.name == s("khronos_intptr_t"))
    {
        result.name = s("s32");
        result.indirection_count = 1;
    }
    
    //string name = *iterator;
    while (true)
    {
        if (try_skip(iterator, s("*")))
        {
            result.indirection_count++;
        }
        else if (try_skip_keyword(iterator, s("const")) || try_skip_keyword(iterator, s("CONST"))) // since windows is DUMB!!! #define CONST const
        {
        }
        else 
        {
            break;
        }
        
        skip_white(iterator);
    }
    
    if ((result.name == s("void")) || (result.name == s("VOID")))
    {
        if (result.indirection_count)
            result.name = s("u8");
        else
            result.name = {};
    }
    
    return result;
}

void print_type(string_builder *builder, parsed_type type)
{
    assert(type.name.count);
    print(builder, "%.*s", fs(type.name));
    
    for (u32 i = 0; i < type.indirection_count; i++)
        print(builder, " ref");
}

void parse_and_print_function_arguments(string_builder *builder, string *iterator, string name, parsed_type return_type, bool define_function)
{
    skip(iterator, s("(")); skip_white(iterator);
    
    print_newline(builder);
    
    if (define_function)
        print(builder, "def %.*s func(", fs(name));
    else
        print(builder, "def %.*s_signature func(", fs(name));
    
    u32 argument_count = 0;
    while (true)
    {
        auto type = skip_type(iterator);
        
        // function line foo(void), because C can ._.
        if (!type.name.count)
            break;
        
        auto name = skip_name(iterator);
        
        if (argument_count)
            print(builder, "; ");
            
        if (name.count)
            print(builder, "%.*s ", fs(name));
        else
            print(builder, "argument%i ", argument_count);
            
        print_type(builder, type);
        
        argument_count++;
        
        if (!try_skip(iterator, s(",")))
            break;
            
        skip_white(iterator);
    }
    
    skip(iterator, s(")"));
    skip_white(iterator);
    skip(iterator, s(";"));
    
    print(builder, ")");
    
    if (return_type.name.count)
    {
        print(builder, " (result ");
        print_type(builder, return_type);
        print(builder, ")");
    }
}

s32 main(s32 argument_count, cstring arguments[])
{
    struct {
        cstring path;
        //bool exclude_wgl_constants;
        bool dont_define_functions;
    } files[] =
    {
        //{ "C:/Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/um/wingdi.h", true },
        { "C:/Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/um/gl/GL.h", },
        { "gl/glext.h", true },
        { "gl/wglext.h", true },
    };
    
    string_buffer constants = {};
    string_buffer dll_functions = {};
    
    string_builder builder = {};
    
    print_line(&builder, "module gl;");
    
    // some GL types
    print_raw(&builder, R"CODE(
// types are manually added, since these are a mess to generate from the headers
def GLenum type u32;

def GLsizei    type ssize;
def GLsizeiptr type ssize;
def GLintptr   type s32 ref;

def GLvoid     type u8; // since its only useful as a pointer
def GLboolean  type u8;
def GLchar     type u8;
def GLbitfield type u32;

def GLubyte  type u8;
def GLushort type u16;
def GLuint   type u32;
def GLuint64 type u64;

def GLbyte  type s8;
def GLshort type s16;
def GLint   type s32;
def GLint64 type s64;

def GLfloat  type f32;
def GLdouble type f64;

def GLclampf type f32;
def GLclampd type f64;

def GLhalf  type s16;
def GLfixed type s32;

def GLuint64EXT type u64;
def GLint64EXT  type s64;

def GLhalfNV         type u16;
def GLvdpauSurfaceNV type GLintptr;

def GLhandleARB   type u32;
def GLcharARB     type u8;
def GLsizeiptrARB type ssize;
def GLintptrARB   type s32 ref;

def GLeglImageOES type u8 ref;

def GLeglClientBufferEXT type u8 ref;

// structs that are passed by pointer only
def GLsync      type u8;

def _cl_context type u8;
def _cl_event   type u8;

// def HGLRDC               type u8;
def HPBUFFERARB          type u8;
def HPBUFFEREXT          type u8;
def HGPUNV               type u8;
def PGPU_DEVICE          type u8;
def HVIDEOOUTPUTDEVICENV type u8;
def HVIDEOINPUTDEVICENV  type u8;
def HPVIDEODEV           type u8;
)CODE");
    
    for (u32 i = 0; i < carray_count(files); i++)
    {
        string source;
        if (!platform_allocate_and_read_entire_file(&source, files[i].path))
            printf("couldn't open file %s\n", files[i].path);
            
        //bool exclude_wgl_constants = files[i].exclude_wgl_constants;
        bool define_function = !files[i].dont_define_functions;
        
        //source = s("GLAPI void APIENTRY glUniformSubroutinesuiv (GLenum shadertype, GLsizei count, const GLuint *indices);");
        //source = s("WINGDIAPI BOOL  WINAPI wglCopyContext(HGLRC, HGLRC, UINT);");
        /*source = s(R"CODE(
WINGDIAPI int   WINAPI wglSetLayerPaletteEntries(HDC, int, int, int,
        CONST COLORREF*);
WINGDIAPI int   WINAPI wglGetLayerPaletteEntries(HDC, int, int, int,
            COLORREF*);)CODE");
        */
        
        auto it = source;
        skip_white(&it);
        
        print_newline(&builder);
        
        print_line(&builder, "// file: %s", files[i].path);
        print_newline(&builder);
        
        while (it.count)
        {
            skip_white(&it);
            
            string line = it;
            
            {
                string ignored;
                if (!try_skip_until_set(&ignored, &it, s("\r\n"), true))
                    it = {};
            }
            
            if (try_skip(&line, s("#")) && try_skip_keyword(&line, s("define")))
            {
                skip_white(&line);
                
                auto name = skip_name(&line);
            
                //if (!starts_with(name, s("GL_")) && (exclude_wgl_constants || !starts_with(name, s("WGL_"))))
                if (!starts_with(name, s("GL_")) && !starts_with(name, s("WGL_")))
                    continue;
                
                string value;
                try_skip_until_set(&value, &line, s("u\r\n"), true); // u is number prefix, we don't care about
                it = line;
                
                if (add_unique(&constants, name))
                    print_line(&builder, "def %.*s = %.*s cast(s32);", fs(name), fs(value));
                continue;
            }
        #if 0
            else if (try_skip_keyword(&line, s("struct")))
            {
                auto name = skip_name(&line);
                if (!try_skip(&line, s(";")))
                    continue;
                
                // forward declared structs will only be passed by pointer, so treat them as u8
                print_line(&builder, "def %.*s type u8;", fs(name));
                it = line;
            }
        #endif
            else if (try_skip_keyword(&line, s("typedef")))
            {
                auto type = skip_type(&line);
                
                if (try_skip(&line, s("(")))
                {
                    // is gl function signature, we generate them ourselfs
                    if (!try_skip_keyword(&line, s("APIENTRY")) || !try_skip(&line, s("*")))
                        continue;
                    
                    skip_white(&line);
                    
                    // is callback signature, we care about, like GLDEBUGPROC
                    auto name = skip_name(&line);
                    
                    if (!starts_with(name, s("GL")))
                        continue;
                    
                    skip(&line, s(")"));
                    
                    parse_and_print_function_arguments(&builder, &line, name, type, true);
                    print_line(&builder, ";");
                    
                    it = line;
                }
                else
                {
                #if 0
                    auto name = skip_name(&line);
                    
                    // probably parsed function pointer type
                    if (!starts_with(name, s("GL")))
                        continue;
                    
                    string ignored;
                    try_skip_until_set(&ignored, &line, s(";"), true);
                    it = line;
                    
                    print(&builder, "def %.*s type ", fs(name));
                    if (type.name.count)
                        print_type(&builder, type);
                    else
                        print(&builder, "u8"); // replacing void
                        
                    print_line(&builder, ";");
                #endif
                }
                continue;
            }
            
            //bool define_function = !try_skip_keyword(&line, s("GLAPI"));
            try_skip_keyword(&line, s("GLAPI"));
            
            try_skip_keyword(&line, s("WINGDIAPI"));
            
            //if (!define_function && !))
                //continue;
                
            //skip_white(&line);
            
            auto return_type = skip_type(&line);
            
            try_skip_keyword(&line, s("APIENTRY"));
            try_skip_keyword(&line, s("WINAPI"));
            
            auto name = skip_name(&line);
            
            if (!starts_with(name, s("gl")) && !starts_with(name, s("wgl")))
                continue;
                
            parse_and_print_function_arguments(&builder, &line, name, return_type, define_function);
            
            if (define_function)
            {
                print_line(&builder, " extern_binding(\"opengl32\", true);");
            }
            else
            {
                print_line(&builder, ";");
                print_line(&builder, "var global %.*s %.*s_signature;", fs(name), fs(name));
                
                add_unique(&dll_functions, name);
            }
    
            it = line;
        }
    }
    
    print_newline(&builder);
    print_line(&builder, "def gl_init_functions func()");
    print_scope_open(&builder);
    
    for (u32 i = 0; i < dll_functions.count; i++)
    {
        auto function = dll_functions.base[i];
        print_line(&builder, "%.*s = wglGetProcAddress(\"%.*s\") cast(%.*s_signature);", fs(function), fs(function), fs(function));
    }
    
    print_scope_close(&builder);
    
    platform_write_entire_file("modules/gl_win32.t", builder.memory.array);

    return 0;
}