
#include <stdio.h>

#include "hash_string.h"
#include "utf8_string.h"

struct parsed_type
{
    string name;
    u32 indirection_count;
};

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
    
    // last name is identifier not part of type
    //iterator->count += (usize) (iterator->base - name.base);
    //iterator->base = name.base;
    
    //result.name.count = (usize) (iterator->base - result.name.base);
    
    return result;
}

void print_type(FILE *output, parsed_type type)
{
    if (type.name == s("void"))
    {
        if (type.indirection_count == 0)
            return;
        
        fprintf(output, "u8");
    }
    else
    {
        fprintf(output, "%.*s", fs(type.name));
    }
    
    for (u32 i = 0; i < type.indirection_count; i++)
        fprintf(output, " ref");
}

s32 main(s32 argument_count, cstring arguments[])
{
    crc32_init();

    string_hash_table table = {};
    table.count = 1024;
    table.keys  = (string *) malloc(sizeof(string) * table.count);
    for (u32 i = 0; i < table.count; i++)
        table.keys[i] = {};
    
    cstring file_paths[] =
    {
        "C:/Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/um/wingdi.h",
        "C:/Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/um/gl/GL.h",
        "gl/glext.h",
        "gl/wglext.h",
    };
    
    auto output = fopen("tests/gl_win32.t", "w");
    
    fprintf(output, "module gl;\n");
    
    for (u32 i = 0; i < carray_count(file_paths); i++)
    {
        string source;
        if (!platform_allocate_and_read_entire_file(&source, file_paths[i]))
            printf("couldn't open file %s\n", file_paths[i]);
        
        //source = s("GLAPI void APIENTRY glUniformSubroutinesuiv (GLenum shadertype, GLsizei count, const GLuint *indices);");
        //source = s("WINGDIAPI BOOL  WINAPI wglCopyContext(HGLRC, HGLRC, UINT);");
        source = s(R"CODE(
WINGDIAPI int   WINAPI wglSetLayerPaletteEntries(HDC, int, int, int,
        CONST COLORREF*);
WINGDIAPI int   WINAPI wglGetLayerPaletteEntries(HDC, int, int, int,
            COLORREF*);)CODE");

        auto it = source;
        skip_white(&it);
        
        fprintf(output, "\n// file: %s\n\n", file_paths[i]);
        
        while (it.count)
        {
            skip_white(&it);
            
            string line = it;
            
            {
                string ignored;
                if (!try_skip_until_set(&ignored, &it, s("\n\r"), true))
                    it = {};
            }
            
            if (try_skip_keyword(&line, s("#define")))
            {
                skip_white(&line);
                
                auto name = skip_name(&line);
            
                if (!starts_with(name, s("GL_")) && !starts_with(name, s("WGL_")))
                    continue;
                
                string value;
                try_skip_until_set(&value, &line, s(";"), true);
                it = line;
                
                fprintf(output, "def %.*s = %.*s;\n", fs(name), fs(value));
                continue;
            }
            else if (try_skip_keyword(&line, s("typedef")))
            {
                auto return_type = skip_type(&line);
                auto name = skip_name(&line);
                
                // probably parsed function pointer type
                if (!name.count)
                    continue;
                
                string ignored;
                try_skip_until_set(&ignored, &line, s(";"), true);
                it = line;
                
                fprintf(output, "def %.*s = type ", fs(name));
                print_type(output, return_type);
                fprintf(output, ";\n");
                continue;
            }
            
            bool define_function = !try_skip_keyword(&line, s("GLAPI"));
            
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
            
            skip(&line, s("(")); skip_white(&line);
            
            if (define_function)
                fprintf(output, "\ndef %.*s func(", fs(name));
            else
                fprintf(output, "\ndef %.*s_signature func(", fs(name));
            
            u32 argument_count = 0;
            while (true)
            {
                auto backup = it;
            
                auto type = skip_type(&line);
                auto name = skip_name(&line);
                
                if (argument_count)
                    fprintf(output, "; ");
                    
                if (name.count)
                    fprintf(output, "%.*s ", fs(name));
                else
                    fprintf(output, "argument%i ", argument_count);
                    
                print_type(output, type);
                
                argument_count++;
                
                if (!try_skip(&line, s(",")))
                    break;
                    
                skip_white(&line);
            }
            
            skip(&line, s(")"));
            skip_white(&line);
            skip(&line, s(";"));
            
            it = line;
            
            fprintf(output, ")");
            
            if ((return_type.name != s("void")) || (return_type.indirection_count != 0))
            {
                fprintf(output, " (result ");
                print_type(output, return_type);
                fprintf(output, ")");
            }
            
            if (define_function)
            {
                fprintf(output, " extern_binding_lib(\"opengl32.lib\");\n");
            }
            else
            {
                fprintf(output, ";\n");
                fprintf(output, "var %.*s %.*s_signature;\n", fs(name), fs(name));
            }
        }
    }
    
    fclose(output);

    return 0;
}