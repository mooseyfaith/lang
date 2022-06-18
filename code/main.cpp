
#if defined _DEBUG
#define LANG_BREAK_ON_ERROR
#endif

#include "lang_c.h"

struct lang_source
{
    string name;
    string text;
};

buffer_type(lang_sources, lang_source_array, lang_source);

void append(lang_sources *sources, cstring path, cstring name)
{
    // HACK: wasting some memory per name
    string_builder builder = {};
    string source_name;
    if (name)
        source_name = print(&builder, "%s\\%s\0", path, name);
    else
        source_name = print(&builder, "%s\0", path);
            
    for (u32 i = 0; i < source_name.count; i++)
        if (source_name.base[i] == '\\')
            source_name.base[i] = '/';
    
    resize_buffer(sources, sources->count + 1);
    require(platform_allocate_and_read_entire_file(&sources->base[sources->count - 1].text, (cstring) source_name.base));
    source_name.count--; // remote 0 terminal                    
    sources->base[sources->count - 1].name = source_name;
}

s32 main(s32 argument_count, cstring arguments[])
{
    if (argument_count < 2)
    {
        printf("requires source files or paths");
        return -1;
    }
    
    lang_parser parser = {};
    reset(&parser);
    
    u64 ticks_per_second;
    u64 time_ticks;
    platform_require(QueryPerformanceFrequency((LARGE_INTEGER *) &ticks_per_second));
    platform_require(QueryPerformanceCounter((LARGE_INTEGER *) &time_ticks));
    
    u64 start_time_ticks = time_ticks;
    u64 last_time_ticks = time_ticks;
    
    lang_sources sources = {};
    
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
                        
                    append(&sources, argument, find_data.cFileName);
                    
                    
                #if 0
                    if (!parse(&parser, source, source_name))
                    {
                        i = argument_count;
                        break;
                    }
                #endif
                }
                while (FindNextFileA(handle, &find_data));
        
                FindClose(handle);
            }
        }
        else
        {
            append(&sources, argument, null);
        }
    }
    
    
    platform_require(QueryPerformanceCounter((LARGE_INTEGER *) &time_ticks));
    u64 load_files_ticks = time_ticks - last_time_ticks;
    last_time_ticks = time_ticks;
    
    for (auto i = 0; i < sources.count; i++)
    {
        if (!parse(&parser, sources.base[i].text, sources.base[i].name))
            break;
    }
    
    platform_require(QueryPerformanceCounter((LARGE_INTEGER *) &time_ticks));
    u64 parse_ticks = time_ticks - last_time_ticks;
    last_time_ticks = time_ticks;
    
    if (!parser.error)
        resolve(&parser);
    
    platform_require(QueryPerformanceCounter((LARGE_INTEGER *) &time_ticks));
    u64 resolve_ticks = time_ticks - last_time_ticks;
    last_time_ticks = time_ticks;
    
    u64 compile_ticks = 0;
    u64 save_output_ticks = 0;
    if (!parser.error)
    {
        lang_c_compile_settings settings = {};
        //settings.prefix = s("tk_");
        auto output = compile(&parser, settings);
        
        platform_require(QueryPerformanceCounter((LARGE_INTEGER *) &time_ticks));
        compile_ticks = time_ticks - last_time_ticks;
        last_time_ticks = time_ticks;
        
        cstring output_file_path = "lang_output.cpp";
        platform_write_entire_file(output_file_path, output.builder.memory.array);
        
        platform_require(QueryPerformanceCounter((LARGE_INTEGER *) &time_ticks));
        save_output_ticks = time_ticks - last_time_ticks;
        last_time_ticks = time_ticks;
    }
    
    if (parser.error)
        printf("\nError: %.*s\n", fs(parser.error_messages.memory.array));
    else if (parser.error_messages.memory.count)
        printf("\nWarnings:\n%.*s\n", fs(parser.error_messages.memory.array));
    
    platform_require(QueryPerformanceCounter((LARGE_INTEGER *) &time_ticks));
    u64 total_ticks = time_ticks - start_time_ticks;
    
    usize line_count = 0;
    usize byte_count = 0;
    for (auto i = 0; i < sources.count; i++)
    {
        auto text = sources.base[i].text;
        
        for (usize i = 0; i < text.count; i++)
        {
            if (text.base[i] == '\n')
                line_count++;
        }
        
        if (text.count)
            line_count++;
        
        byte_count += text.count;
    }
    
    printf("  load files time: % 6.3fs (%12.2f lines per second, %15.2f bytes per second)\n", (f32) load_files_ticks / ticks_per_second,  (f32) line_count * ticks_per_second / load_files_ticks,  (f32) byte_count * ticks_per_second / load_files_ticks);
    printf("       parse time: % 6.3fs (%12.2f lines per second, %15.2f bytes per second)\n", (f32) parse_ticks / ticks_per_second,       (f32) line_count * ticks_per_second / parse_ticks,       (f32) byte_count * ticks_per_second / parse_ticks);
    printf("     resolve time: % 6.3fs (%12.2f lines per second, %15.2f bytes per second)\n", (f32) resolve_ticks / ticks_per_second,     (f32) line_count * ticks_per_second / resolve_ticks,     (f32) byte_count * ticks_per_second / resolve_ticks);
    printf("compile to C time: % 6.3fs (%12.2f lines per second, %15.2f bytes per second)\n", (f32) compile_ticks / ticks_per_second,     (f32) line_count * ticks_per_second / compile_ticks,     (f32) byte_count * ticks_per_second / compile_ticks);
    printf(" save output time: % 6.3fs (%12.2f lines per second, %15.2f bytes per second)\n", (f32) save_output_ticks / ticks_per_second, (f32) line_count * ticks_per_second / save_output_ticks, (f32) byte_count * ticks_per_second / save_output_ticks);
    printf("       total time: % 6.3fs (%12.2f lines per second, %15.2f bytes per second)\n", (f32) total_ticks / ticks_per_second,       (f32) line_count * ticks_per_second / total_ticks,       (f32) byte_count * ticks_per_second / total_ticks);
    
    byte_count_info info;
    info.value = byte_count;
    printf("      total count: %llu lines (%llugb %llumb %llukb %llub)\n", line_count, info.giga, info.mega, info.kilo, info.byte);
    printf("\n");
    
#if defined _DEBUG

    if (0)
    {
        auto table = &global_debug_platform_allocation_table;
        
        byte_count_info info;
        info.value = table->byte_count;
        printf("\nMemory: %llugb %llumb %llukb %llub (in %llu different allocations)\n", info.giga, info.mega, info.kilo, info.byte, table->count);
        for (usize i = 0; i < table->count; i++)
        {
            auto location = table->locations[i];
            printf("Allocation: %s,%s(%i) 0x%08p %llu bytes\n", location.file, location.function, location.line, table->bases[i], table->byte_counts[i]);
        }
    }

#endif
    
    //printf("done\n");

    return 0;
}