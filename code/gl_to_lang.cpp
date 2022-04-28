
#include <stdio.h>

#include "hash_string.h"
#include "utf8_string.h"

string read_entire_file(cstring path)
{
    auto file = fopen(path, "r");

    string source;
    
    fseek(file, 0, SEEK_END);
    source.count = ftell(file);
    rewind(file);

    source.base = (u8 *) malloc(source.count);
    fread((char *) source.base, 1, source.count, file);

    fclose(file);
    
    return source;
}

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
    
    try_skip_keyword(iterator, s("struct"));
    
    result.name = skip_name(iterator);
    
    string name = *iterator;
    while (true)
    {
        if (try_skip(iterator, s("*")))
        {
            result.indirection_count++;
        }
        else
        {
            auto test_name = skip_name(iterator);
            if (!test_name.count)
                break;
            
            name = test_name;
        }
        
        skip_white(iterator);
    }
    
    // last name is identifier not part of type
    iterator->count += (usize) (iterator->base - name.base);
    iterator->base = name.base;
    
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
        "C:/Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/um/gl/GL.h",
        "gl/glext.h",
        "gl/wglext.h",
    };
    
    auto output = fopen("tests/gl_win32.t", "w");
    
    fprintf(output, "module gl;\n");
    
    for (u32 i = 0; i < carray_count(file_paths); i++)
    {
        auto source = read_entire_file(file_paths[i]);
        
        auto it = source;
        skip_white(&it);
        
        fprintf(output, "\n// file: %s\n\n", file_paths[i]);
        
        while (it.count)
        {
            string line;
            if (!try_skip_until_set(&line, &it, s("\n\r")))
                break;
                
            skip_white(&it);
            
            if (try_skip(&line, s("#define")))
            {
                skip_white(&line);
                
                auto name = skip_name(&line);
            
                if (!starts_with(name, s("GL_")) && !starts_with(name, s("WGL_")))
                    continue;
                
                fprintf(output, "def %.*s = %.*s;\n", fs(name), fs(line));
            }
            
            bool define_function = try_skip_keyword(&line, s("WINGDIAPI"));
            
            if (!define_function && !try_skip(&line, s("GLAPI")))
                continue;
                
            skip_white(&line);
            
            auto return_type = skip_type(&line);
            try_skip_keyword(&line, s("APIENTRY"));
            
            auto name = skip_name(&line);
            
            if (!starts_with(name, s("gl")) && !starts_with(name, s("wgl")))
                continue;
            
            skip(&line, s("(")); skip_white(&line);
            
            if (define_function)
                fprintf(output, "\ndef %.*s func(", fs(name));
            else
                fprintf(output, "\ndef %.*s_signature func(", fs(name));
            
            bool is_first = true;
            while (true)
            {
                auto type = skip_type(&line);
                auto name = skip_name(&line);
                
                if (!is_first)
                    fprintf(output, "; ");
                    
                fprintf(output, "%.*s ", fs(name));
                print_type(output, type);
                
                is_first = false;
                
                if (!try_skip(&line, s(",")))
                    break;
                    
                skip_white(&line);
            }
            
            skip(&line, s(")"));
            skip_white(&line);
            
            fprintf(output, ")");
            
            if ((return_type.name != s("void")) || (return_type.indirection_count != 0))
            {
                fprintf(output, " (result ");
                print_type(output, return_type);
                fprintf(output, ")");
            }
            
            if (define_function)
                fprintf(output, " extern_binding_dll(\"opengl32.dll\");\n");
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