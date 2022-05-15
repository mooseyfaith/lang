
#pragma once

typedef signed __int8  s8;
typedef signed __int16 s16;
typedef signed __int32 s32;
typedef signed __int64 s64;


typedef unsigned __int8  u8;
typedef unsigned __int16 u16;
typedef unsigned __int32 u32;
typedef unsigned __int64 u64;

// assuming x64
typedef s64 ssize;
typedef u64 usize;

typedef float  f32;
typedef double f64;

#define null 0

#define flag(index) ( 1 << (index) )

typedef char * cstring;

// C static array count
#define carray_count(static_array) ( sizeof(static_array) / sizeof((static_array)[0]) )

const f32 pi32 = 3.14159265358979323846;

#define array_type(name, type) \
struct name \
{ \
    usize count; \
    type  *base; \
};

#define buffer_type(name, type) \
struct name \
{ \
    usize count; \
    type  *base; \
    usize capacity; \
};

array_type(base_array, u8);
buffer_type(base_buffer, u8);

array_type(u8_array, u8);
buffer_type(u8_buffer, u8);

typedef u8_array string;

array_type(string_array, string);
buffer_type(string_buffer, string);

// without 0 terminal character
#define s(cstring_literal) string { carray_count(cstring_literal) - 1, (u8 *) cstring_literal }

// printf("%.*s", fs(my_string));
#define fs(string) ((int) (string).count), ((char *) (string).base)

static f32 clamp(f32 min, f32 value, f32 max)
{
    if (value < min)
        return min;
    else if (value > max)
        return max;
    else
        return value;
}

static f32 minimum(f32 a, f32 b)
{
    if (a < b)
        return a;
    else
        return b;
}

static f32 maximum(f32 a, f32 b)
{
    if (a >= b)
        return a;
    else
        return b;
}

static f32 absolute(f32 a)
{
    if (a < 0.0f)
        return -a;
    else
        return a;
}

static f32 sign(f32 a)
{
    if (a < 0.0f)
        return -1;
    else if (a > 0.0f)
        return 1;
    else
        return 0;
}

static f32 lerp(f32 a, f32 b, f32 factor)
{
    f32 result = a * (1.0f - factor) + b * factor;
    return result;
}

#define mlocation_file     __FILE__
#define mlocation_function __FUNCTION__
#define mlocation_line     __LINE__

#define platform_fatal_error_location_va_declaration \
    static bool platform_fatal_error_location_va(cstring file, cstring function, u32 line, cstring label, cstring format, va_list va_arguments)

#define platform_fatal_error_location_declaration \
    static bool platform_fatal_error_location(cstring file, cstring function, u32 line, cstring label, cstring format, ...)

platform_fatal_error_location_va_declaration;
platform_fatal_error_location_declaration;

#define platform_conditional_fatal_error_location(condition, file, function, line, label, format, ...)  \
    if (!(condition)) \
        if (platform_fatal_error_location(file, function, line, label, format,  __VA_ARGS__)) \
            __debugbreak();

#if defined _DEBUG

    #define assert_location(condition, file, function, line, ...) \
        platform_conditional_fatal_error_location(condition, file, function, line, "Assertion Failure", "Assertion:\n    " # condition "\nfailed.\n\n" __VA_ARGS__)

    #define assert(condition, ...) assert_location(condition, __FILE__, __FUNCTION__, __LINE__, __VA_ARGS__)
    
#else

    #define assert_location(...)
    #define assert(...)

#endif

#define require_location(condition, file, function, line, ...) \
        platform_conditional_fatal_error_location(condition, file, function, line, "Error", "Requirement:\n    " # condition "\nfailed.\n\n" __VA_ARGS__)

#define require(condition, ...) require_location(condition, __FILE__, __FUNCTION__, __LINE__, __VA_ARGS__)

#define unreachable_codepath  assert(false, "unreachable codepath")

#define cases_complete_message(format, ...) default: assert(false, "unhandled case: " format, __VA_ARGS__);
#define cases_complete                      default: assert(false, "unhandled case");

#define require_result(expression, result, format) { \
    auto value = (expression); \
    require(value == (result), "unexpected value " format "\n", value); \
}

template <typename F>
struct Deferer {
    F f;
    
    Deferer(F f) : f(f) {}
    ~Deferer() { f(); }
};

template <typename F>
Deferer<F> operator++(F f) { return Deferer<F>(f); }

// macro chain
#define _mchain(a, b) a ## b
#define mchain(a, b) _mchain(a, b)

#define defer \
auto mchain(_defer_, __LINE__) = ++[&]()

#define mswap(a, b) { auto temp = a; a = b; b = temp; }

#define using(struct, field)      auto field = &(struct)->field
#define local_copy(struct, field) auto field = (struct).field

#define field_to_struct_pointer(type, field, pointer) ( (type *) ((u8 *) (pointer) - ((usize) &((type *) null)->field)) )

#define scope_save(var) \
    auto mchain(_scope_backup_, __LINE__) = var; \
    defer { var = mchain(_scope_backup_, __LINE__); };
    
#define scope_push(var, value) \
    scope_save(var); \
    var = value;
    
#define values_are_equal(a_value, b_value) bytes_are_equal(sizeof(a_value), (u8 *) &(a_value), (u8 *) &(b_value))

static bool bytes_are_equal(usize byte_count, u8 *a, u8 *b)
{
    for (usize i = 0; i < byte_count; i++)
    {
        if (a[i] != b[i])
            return false;
    }
    
    return true;
}

bool operator==(string a, string b)
{
    if (a.count != b.count)
        return false;
    
    return bytes_are_equal(a.count, a.base, b.base);
}

bool operator!=(string a, string b)
{
    return !(a == b);
}

u32 get_bit_count(u64 value)
{
    u32 result = (u32) __popcnt64(value);
    return result;
}

// returns 0 on 0
u32 get_highest_bit_index(u64 value)
{
    unsigned long index;
    bool is_none_zero = _BitScanReverse64(&index, value);
    if (!is_none_zero)
        index = 0;
        
    return (u32) index;
}

void advance(u8_array *array, usize count = 1)
{
    assert(array->count >= count);
    array->base  += count;
    array->count -= count;
}

string skip(string *iterator, usize count)
{
    string result = { count, iterator->base };
    advance(iterator, count);
    
    return result;
}

#include<windows.h>

#pragma comment(lib, "user32.lib")
//#pragma comment(lib, "gdi32.lib")

platform_fatal_error_location_va_declaration
{
    cstring layout =
        "%s,%d\n"
        "    %s\n"
        "\n";

    u32 byte_count = _scprintf(layout, file, line, function);
    byte_count += _vscprintf(format, va_arguments);
     
    u8 _text[1024];
    string text = { carray_count(_text),  _text };
    
    u32 offset = 0;
    offset += sprintf_s((char *) text.base, text.count, layout, file, line, function);
    offset += vsprintf_s((char *) text.base + offset, text.count - offset, format, va_arguments);
    
    printf("\n%s:\n%s\n", label, text.base);
    
    bool do_break = false;
    switch (MessageBox(null, (char *) text.base, label, MB_TASKMODAL | MB_CANCELTRYCONTINUE | MB_ICONERROR))
    { 
        // Instead of calling debug break here, we just return if we want to break.
        // This way we can place the break in the assert macro and actually break at the right position
        case IDTRYAGAIN:
        {
            do_break = true;
        } break;
        
        case IDCANCEL:
        {
            exit(-1);
        } break;
    }   
    
    return do_break;
}

platform_fatal_error_location_declaration
{
    va_list va_arguments;
    va_start(va_arguments, format);
    
    bool do_break = platform_fatal_error_location_va(file, function, line, label, format, va_arguments);
    
    va_end(va_arguments);
    
    return do_break;
}

struct platform_file_info
{
    bool ok;
    u64 byte_count;
    u64 write_timestamp;
};

platform_file_info platform_get_file_info(cstring file_path)
{
    WIN32_FILE_ATTRIBUTE_DATA data;
    BOOL ok = GetFileAttributesExA(file_path, GetFileExInfoStandard, &data);
    
    if (!ok)
        return {};
    
    u64 byte_count = (((u64) data.nFileSizeHigh) << 32) | data.nFileSizeLow;
    
    u64 write_timestamp = (((u64) data.ftLastWriteTime.dwHighDateTime) << 32) | (u64) data.ftLastWriteTime.dwLowDateTime;
    
    platform_file_info result;
    result.ok = true;
    result.byte_count = byte_count;
    result.write_timestamp = write_timestamp;
    
    return result;
}

bool platform_read_entire_file(u8_array memory, cstring file_path)
{
    auto file_info = platform_get_file_info(file_path);
    assert(file_info.ok && (file_info.byte_count == memory.count));

    HANDLE file_handle = CreateFileA(file_path, GENERIC_READ, FILE_SHARE_READ, null, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, null);
    
    // might be written to
    if (file_handle == INVALID_HANDLE_VALUE)
        return false;
    
    // we can only read in ~4gb chunks
    while (memory.count)
    {
        DWORD byte_count;
        
        // has higher bits set
        if (memory.count >> 32) 
            byte_count = 0xFFFFFFFF;
        else
            byte_count = memory.count;
        
        DWORD read_byte_count;
        auto ok = ReadFile(file_handle, memory.base, byte_count, &read_byte_count, null);
        assert(ok && (byte_count == read_byte_count));
        
        memory.base  += byte_count;
        memory.count -= byte_count;
    }
    
    CloseHandle(file_handle);
    
    return true;
}

void platform_write_entire_file(cstring file_path, u8_array memory)
{
    HANDLE file_handle = CreateFileA(file_path, GENERIC_WRITE, 0, null, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, null);
    assert(file_handle != INVALID_HANDLE_VALUE, "GetLastError() = 0x%x", GetLastError());
    
    while (memory.count)
    {
        DWORD byte_count;
        // has higher bits set
        if (memory.count >> 32) 
            byte_count = 0xFFFFFFFF;
        else
            byte_count = memory.count;
        
        DWORD write_byte_count;
        auto ok = WriteFile(file_handle, memory.base, byte_count, &write_byte_count, null);
        assert(ok && (byte_count == write_byte_count));
        
        memory.base  += byte_count;
        memory.count -= byte_count;
    }
    
    CloseHandle(file_handle);
}

u8_array platform_allocate_bytes(usize byte_count)
{
    usize page_alignment_mask = 4095;
    
    u8_array memory;
    memory.count = (byte_count + page_alignment_mask) & ~page_alignment_mask;
    memory.base  = (u8 *) VirtualAlloc(null, memory.count, MEM_COMMIT, PAGE_READWRITE);
    require(memory.base, "out of memory"); // this will never trigger on x64
    
    return memory;
}

void platform_free_bytes(u8 *base)
{
    if (base)
    {
        require( VirtualFree((void *) base, 0, MEM_RELEASE) );
    }
}

bool platform_allocate_and_read_entire_file(u8_array *out_data, cstring file_path)
{
    auto file_info = platform_get_file_info(file_path);
    if (!file_info.ok)
        return false;
    
    u8_array data = platform_allocate_bytes(file_info.byte_count);
    data.count = file_info.byte_count; // since allocate will allocate more if it can (allocates multiple pages)
    platform_read_entire_file(data, file_path);
    
    *out_data = data;
    
    return true;
}

#define resize_buffer(buffer, new_count) resize_base_buffer((base_buffer *) (buffer), new_count, sizeof(*(buffer)->base))

#define buffer_to_array(buffer) { (buffer).count, (buffer).base }
 
#define copy_array(dest, source) copy_base_array((base_array *) (dest), (base_array) { (source).base, (source).count }, sizeof((source).base[0]))

void copy_base_array(base_array *destination, base_array source, u32 item_byte_count)
{
    *destination = {};
    destination->count = source.count;
    destination->base = platform_allocate_bytes(item_byte_count * source.count).base;
    memcpy(destination->base, source.base, item_byte_count * source.count);
}

void resize_base_buffer(base_buffer *buffer, usize new_count, u32 item_byte_count)
{
    if (new_count >= buffer->capacity)
    {
        buffer->capacity = maximum(maximum(buffer->capacity, new_count) * 2, 32);
        
        auto new_base = platform_allocate_bytes(item_byte_count * buffer->capacity).base;
        
        if (buffer->base)
            memcpy(new_base, buffer->base, item_byte_count * buffer->count);
            
        platform_free_bytes(buffer->base);
    
        buffer->base = new_base;
    }
    
    buffer->count = new_count;
}