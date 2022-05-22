
#include <stdio.h>

#include "hash_string.h"
#include "lang_c.h"

s32 main(s32 argument_count, cstring arguments[])
{
    if (argument_count < 2)
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
    
    resolve(&parser);
    
    lang_c_compile_settings settings = {};
    //settings.prefix = s("tk_");
    auto output = compile(&parser, settings);
    
    cstring output_file_path = "lang_output.cpp";
    platform_write_entire_file(output_file_path, output);
    platform_free_bytes(output.base);
    
#if defined _DEBUG

    {
        auto table = &global_debug_platform_allocation_table;
        
        byte_count_info info;
        info.value = table->byte_count;
        printf("\nMemory: %llugb %llumb %llukb %llub (in %llu different allocations)\n", info.giga, info.mega, info.kilo, info.bytes, table->count);
        for (usize i = 0; i < table->count; i++)
        {
            auto location = table->locations[i];
            printf("Allocation: %s,%s(%i) 0x%08p %llu bytes\n", location.file, location.function, location.line, table->bases[i], table->byte_counts[i]);
        }
    }

#endif
    
    printf("done\n");

    return 0;
}