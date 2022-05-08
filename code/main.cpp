
#include <stdio.h>

#include "hash_string.h"
#include "lang_c.h"

s32 main(s32 argument_count, cstring arguments[])
{
    crc32_init();

    string_hash_table table = {};
    table.count = 1024;
    table.keys  = (string *) malloc(sizeof(string) * table.count);
    for (u32 i = 0; i < table.count; i++)
        table.keys[i] = {};
    
    // window_class.lpfnWndProc   = window_callback;
    
    if (argument_count < 2)
    {
        printf("requires source file");
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
    
    resolve(&parser);
    
    lang_c_compile_settings settings = {};
    //settings.prefix = s("tk_");
    compile(&parser, settings);

    return 0;
}