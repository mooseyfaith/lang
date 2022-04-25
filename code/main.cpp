
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
    
#if 1
    auto file = fopen(arguments[1], "r");

    string source_name = { strlen(arguments[1]), (u8 *) arguments[1] };
    string source;
    
    fseek(file, 0, SEEK_END);
    source.count = ftell(file);
    rewind(file);

    source.base = (u8 *) malloc(source.count);
    fread((char *) source.base, 1, source.count, file);

    fclose(file);

#else
    string source_name = s("internal");
    string source = s(R"CODE(

var win32_instance HINSTANCE = GetModuleHandle(NULL) cast(HINSTANCE);
var window_class_name cstring = "My Window Class";

var window_class WNDCLASSA;

window_class.hInstance     = win32_instance;
window_class.lpfnWndProc   = DefWindowProc;
window_class.hbrBackground = COLOR_BACKGROUND cast(HBRUSH);
window_class.lpszClassName = window_class_name;
window_class.style         = CS_OWNDC;
window_class.hCursor       = LoadCursor(NULL, IDC_ARROW);
RegisterClass(window_class ref);

var window_handle HWND = CreateWindow(window_class_name, "test", WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, 640, 480, 0, 0, win32_instance, 0);
var device_context HDC = GetDC(window_handle);
ShowWindow(window_handle, SW_SHOW);

while true
{
}

var x = 12;
if x {
    x = 41;
}
printf("fun %i", x);
)CODE");

#endif
    
    auto first_statement = parse(source, source_name);
    
#if 0
    if (first_statement)
    {
        ast_queue queue = {};
        enqueue(&queue, first_statement);
        
        ast_node *node;
        while (next(&node, &queue))
        {
            printf("%.*s 0x%p\n", fs(ast_node_type_names[node->node_type]), node);
        }
    }
#endif
    
    lang_c_compile_settings settings = {};
    //settings.prefix = s("tk_");
    compile(first_statement, settings);
    
    string a = s("foo");
    string b = s("bar");
    
    auto r = get(&table, a);
    r = get(&table, b);
    
    for (u32 i = 0; i < table.count; i++)
    {
        if (table.keys[i].count)
        {
            printf("%i '%.*s'\n", i, fs(table.keys[i]));
        }
    }

    return 0;
}