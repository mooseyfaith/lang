
#include <stdio.h>

#include "hash_string.h"
#include "lang_c.h"

s32 main(s32 argument_count, cstring arguments[])
{
    u8_buffer console_input = {};
    
    if (0)
    {
        char line[1024];
        while(fgets(line, 1000, stdin) != null)
        {
            u32 count = strlen(line);
            resize_buffer(&console_input, console_input.count + count + 1);
            sprintf_s((char *) console_input.base + console_input.count - count - 1, count + 1, line);
            
            resize_buffer(&console_input, console_input.count - 1); // remove 0 terminal
        }
    }
    
    if (!console_input.count && (argument_count < 2))
    {
        printf("requires source file or std input");
        return -1;
    }
    
    lang_parser parser;
    begin(&parser);
    
    for (u32 i = 1; i < argument_count; i++)
    {
        auto argument = arguments[i];
        if (GetFileAttributesA(argument) & FILE_ATTRIBUTE_DIRECTORY)
        {
            WIN32_FIND_DATAA find_data;
            
            char pattern[1024];
            sprintf_s(pattern, carray_count(pattern), "%s\\*", argument);
            
            auto handle = FindFirstFileA(pattern, &find_data);
            if (handle != INVALID_HANDLE_VALUE)
            {
                do
                {
                    if (find_data.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)
                        continue;
                
                    // HACK:
                    cstring path = new char[1024];
                    sprintf_s(path, 1024, "%s\\%s", argument, find_data.cFileName);
    
                    string source_name = { strlen(path), (u8 *) path };
                    
                    for (u32 i = 0; i < source_name.count; i++)
                        if (source_name.base[i] == '\\')
                            source_name.base[i] = '/';
                    
                    string source;
                    require(platform_allocate_and_read_entire_file(&source, path));
                    
                    if (!parse(&parser, source, source_name))
                        return -1;        
                }
                while (FindNextFileA(handle, &find_data));
        
                FindClose(handle);
            }
        }
        else
        {
            auto path = argument;
            auto file = fopen(path, "r");
    
            string source_name = { strlen(path), (u8 *) path };
            
            for (u32 i = 0; i < source_name.count; i++)
                if (source_name.base[i] == '\\')
                    source_name.base[i] = '/';
            
            string source;
            require(platform_allocate_and_read_entire_file(&source, path));
        
            if (!parse(&parser, source, source_name))
                return -1;        
        }
    }
    
    if (console_input.count && !parse(&parser, buffer_to_array(console_input), s("console input")))
        return -1;        
    
    resolve(&parser);
    
    lang_c_compile_settings settings = {};
    //settings.prefix = s("tk_");
    compile(&parser, settings);
    
    printf("done\n");

    return 0;
}