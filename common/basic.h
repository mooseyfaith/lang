
#pragma once

#include <stdio.h>

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

#define buffer_type(buffer_name, array_name, type) \
array_type(array_name, type); \
union buffer_name \
{ \
    array_name array; \
    \
    struct \
    { \
        usize count; \
        type  *base; \
        usize capacity; \
    }; \
};

buffer_type(base_buffer, base_array, u8);

buffer_type(u8_buffer, u8_array, u8);
buffer_type(u32_buffer, u32_array, u32);
buffer_type(s32_buffer, s32_array, s32);
buffer_type(f32_buffer, f32_array, f32);

typedef u8_array string;

buffer_type(string_buffer, string_array, string);

struct base_single_list_entry
{
    base_single_list_entry *next;
};

#define single_list_type(name, type) \
struct name \
{ \
    type *first; \
    type **tail_next; \
};

typedef base_single_list_entry **base_list_tail_next;

single_list_type(base_single_list, base_single_list_entry);

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

struct code_location
{
    cstring file;
    cstring function;
    u32 line;
};

union byte_count_info
{
    usize value;
    
    struct
    {
        usize byte : 10;
        usize kilo : 10;
        usize mega : 10;
        usize giga : 34;
    };
};

#define _get_call_location() code_location { __FILE__, __FUNCTION__, __LINE__ }
#define get_call_location() _get_call_location()
#define call_location_argument code_location call_location
    
#define platform_fatal_error_location_va_declaration \
    static bool platform_fatal_error_location_va(code_location location, cstring label, cstring format, va_list va_arguments)

#define platform_fatal_error_location_declaration \
    static bool platform_fatal_error_location(code_location location, cstring label, cstring format, ...)

platform_fatal_error_location_va_declaration;
platform_fatal_error_location_declaration;

#define platform_conditional_fatal_error_location(condition, location, label, format, ...)  \
    if (!(condition)) \
        if (platform_fatal_error_location(location, label, format,  __VA_ARGS__)) \
            __debugbreak();

#if defined _DEBUG

    #define debug_get_call_location()    , get_call_location()
    #define debug_call_location_argument , code_location debug_location
    #define debug_call_location          , debug_location
    
    #define assert_location(condition, location, ...) \
        platform_conditional_fatal_error_location(condition, location, "Assertion Failure", "Assertion:\n    " # condition "\nfailed.\n\n" __VA_ARGS__)

    #define assert(condition, ...) assert_location(condition, get_call_location(), __VA_ARGS__)
    
#else

    #define debug_get_call_location()
    #define debug_call_location_argument
    #define debug_call_location
    
    #define assert_location(...)
    #define assert(...)

#endif

#define require_location(condition, location, ...) \
        platform_conditional_fatal_error_location(condition, location, "Error", "Requirement:\n    " # condition "\nfailed.\n\n" __VA_ARGS__)

#define require(condition, ...) require_location(condition, get_call_location(), __VA_ARGS__)

#define unreachable_codepath  assert(false, "unreachable codepath")

#define cases_complete_message(format, ...) default: { assert(false, "unhandled case: " format, __VA_ARGS__); } break;
#define cases_complete                      default: { assert(false, "unhandled case"); } break;

#define require_result(expression, result, format) { \
    auto value = (expression); \
    require(value == (result), "unexpected value " format "\n", value); \
}

#define platform_require_location(condition, location, ...) \
        platform_conditional_fatal_error_location(condition, location, "Error", "Requirement:\n    " # condition "\nfailed.\n\nGetLastError(): 0x%08x" __VA_ARGS__, GetLastError())

#define platform_require(condition, ...) platform_require_location(condition, get_call_location(), __VA_ARGS__)

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

#define mlist_enum(entry, prefix) \
    prefix ## entry,

#define mlist_name(entry, ...) \
    s(# entry),
    
#define mlist_byte_count(entry, prefix) \
    sizeof(prefix ## entry),

#define using(struct, field)      auto field = &(struct)->field
#define local_copy(struct, field) auto field = (struct).field

#define field_to_struct_pointer(type, field, pointer) ( (type *) ((u8 *) (pointer) - ((usize) &((type *) null)->field)) )

#define scope_save(var) \
    auto mchain(_scope_backup_, __LINE__) = var; \
    defer { var = mchain(_scope_backup_, __LINE__); };
    
#define scope_push(var, value) \
    scope_save(var); \
    var = value;

#define value_to_u8_array(value) u8_array{ sizeof(value), (u8 *) &value }

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


#include <intrin.h>

// returns 0 on 0
u32 get_highest_bit_index(u64 value)
{
    unsigned long index; // because unsigned long is soooo different form unsigned int. It's not!
    bool is_none_zero = _BitScanReverse64(&index, value);
    if (!is_none_zero)
        index = 0;
        
    return (u32) index + 1;
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

    u32 byte_count = _scprintf(layout, location.file, location.line, location.function);
    byte_count += _vscprintf(format, va_arguments);
     
    u8 _text[1024];
    string text = { carray_count(_text),  _text };
    
    u32 offset = 0;
    offset += sprintf_s((char *) text.base, text.count, layout, location.file, location.line, location.function);
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
    
    bool do_break = platform_fatal_error_location_va(location, label, format, va_arguments);
    
    va_end(va_arguments);
    
    return do_break;
}

#if defined _DEBUG

const int debug_platform_allocation_table_count = 1 << 12;

struct debug_platform_allocation_table
{
    u8            *bases[debug_platform_allocation_table_count];
    usize         byte_counts[debug_platform_allocation_table_count];
    code_location locations[debug_platform_allocation_table_count];
    usize count;
    
    usize byte_count;
};

debug_platform_allocation_table global_debug_platform_allocation_table;

#endif

#define platform_allocate_bytes(byte_count) platform_allocate_bytes_location(byte_count, get_call_location())

u8_array platform_allocate_bytes_location(usize byte_count, call_location_argument)
{
    usize page_alignment_mask = 4095;
    
    u8_array memory;
    memory.count = (byte_count + page_alignment_mask) & ~page_alignment_mask;
    memory.base  = (u8 *) VirtualAlloc(null, memory.count, MEM_COMMIT, PAGE_READWRITE);
    platform_require_location(memory.base, call_location, "out of memory"); // this will never trigger on x64
    
#if defined _DEBUG

    {
        auto table = &global_debug_platform_allocation_table;
        
        for (usize i = 0; i < table->count; i++)
        {
            assert(table->bases[i] != memory.base);
        }
        
        assert(table->count < carray_count(table->bases));
        table->bases[table->count]       = memory.base;
        table->byte_counts[table->count] = memory.count;
        table->locations[table->count]   = call_location;
        table->count++;
        
        table->byte_count += memory.count;
    }
    
#endif
    
    return memory;
}

#define platform_free_bytes(base) platform_free_bytes_location(base, get_call_location())

void platform_free_bytes_location(u8 *base, call_location_argument)
{
    if (base)
        platform_require_location(VirtualFree((void *) base, 0, MEM_RELEASE), call_location);
        
#if defined _DEBUG

    if (base)
    {
        auto table = &global_debug_platform_allocation_table;
        
        usize index = -1;
        for (usize i = 0; i < table->count; i++)
        {
            if (table->bases[i] == base)
            {
                index = i;
                break;
            }
        }
        
        assert(index != -1);
        assert(table->count);
        
        assert(table->byte_counts[index] <= table->byte_count);
        table->byte_count -= table->byte_counts[index];
        
        --table->count;
        table->bases[index]       = table->bases[table->count];
        table->byte_counts[index] = table->byte_counts[table->count];
        table->locations[index]   = table->locations[table->count];
    }
    
#endif
}

#define resize_buffer(buffer, new_count) resize_base_buffer((base_buffer *) (buffer), new_count, sizeof(*(buffer)->base), get_call_location())
#define free_buffer(buffer)              free_base_buffer((base_buffer *) (buffer), get_call_location())

#define copy_array(dest, source) copy_base_array((base_array *) (dest), (base_array) { (source).base, (source).count }, sizeof((source).base[0]))

void copy_base_array(base_array *destination, base_array source, u32 item_byte_count)
{
    *destination = {};
    destination->count = source.count;
    destination->base = platform_allocate_bytes(item_byte_count * source.count).base;
    memcpy(destination->base, source.base, item_byte_count * source.count);
}

void resize_base_buffer(base_buffer *buffer, usize new_count, u32 item_byte_count, call_location_argument)
{
    if (new_count >= buffer->capacity)
    {
        buffer->capacity = maximum(maximum(buffer->capacity, new_count) * 2, 32);
        
        auto new_base = platform_allocate_bytes_location(item_byte_count * buffer->capacity, call_location).base;
        
        if (buffer->base)
            memcpy(new_base, buffer->base, item_byte_count * buffer->count);
            
        platform_free_bytes_location(buffer->base, call_location);
    
        buffer->base = new_base;
    }
    
    buffer->count = new_count;
}

void free_base_buffer(base_buffer *buffer, call_location_argument)
{
    platform_free_bytes_location(buffer->base, call_location);
    *buffer = {};
}

struct memory_arena
{
    u8_buffer buffer;
    
#if defined _DEBUG
    usize debug_max_count;
#endif
};

#define allocate_items(memory, type, count) ( (type *) allocate_bytes(memory, sizeof(type) * (count), alignof(type)) )
#define allocate_item(memory, type)         allocate_items(memory, type, 1)
//#define reallocate_items(memory, type, base, count) ( (type *) reallocate_bytes(memory, (u8 *) &(base), sizeof(type) * (count), alignof(type)) )

#define allocate_array(memory, type, count)    { (usize) (count), allocate_items(memory, type, count) }
#define reallocate_array(memory, array, count) reallocate_base_array(memory, (base_array *) (array), count, sizeof(*(array)->base), alignof(decltype(*(array)->base)))
#define free_array(memory, array) free_bytes(memory, (u8 *) (array)->base)

u8 * allocate_bytes(memory_arena *memory, usize byte_count, u32 byte_alignment)
{
    if (!byte_count)
        return null;

    usize alignment_mask = byte_alignment - 1;
    assert((alignment_mask & byte_alignment) == 0, "alignment must be power of 2");
    
    usize buffer_count = (memory->buffer.count + alignment_mask) & ~alignment_mask;
    assert(buffer_count + byte_count <= memory->buffer.capacity);
    
    auto base = memory->buffer.base + buffer_count;
    memory->buffer.count = buffer_count + byte_count;
    
#if _DEBUG
    memory->debug_max_count = maximum(memory->debug_max_count, memory->buffer.count);
#endif
    
    return base;
}

void free_bytes(memory_arena *memory, u8 *base)
{
    if (!base)
        return;
        
    usize count = (usize) (base - memory->buffer.base);
    assert(count <= memory->buffer.count);
    
    memory->buffer.count = count;
}

u8 * reallocate_bytes(memory_arena *memory, u8 **base, usize byte_count, u32 byte_alignment)
{
    free_bytes(memory, *base);
    auto new_base = allocate_bytes(memory, byte_count, byte_alignment);
    
    assert(!*base || !new_base || (*base == new_base));
    *base = new_base;
    
    return new_base;
}

void reallocate_base_array(memory_arena *memory, base_array *array, usize count, usize item_byte_count, u32 item_byte_alignment)
{
    reallocate_bytes(memory, &array->base, item_byte_count * count, item_byte_alignment);
    array->count = count;
}

void clear(memory_arena *memory)
{
    memory->buffer.count = 0;
}

struct platform_file_info
{
    u64 byte_count;
    u64 write_timestamp;
    bool ok, is_directory;
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
    result.is_directory = (data.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) != 0;
    result.byte_count = byte_count;
    result.write_timestamp = write_timestamp;
    
    return result;
}

bool platform_read_entire_file(u8_array memory, cstring file_path)
{
    auto file_info = platform_get_file_info(file_path);
    assert(file_info.ok && !file_info.is_directory && (file_info.byte_count == memory.count));

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

bool platform_write_entire_file(cstring file_path, u8_array memory)
{
    HANDLE file_handle = CreateFileA(file_path, GENERIC_WRITE, 0, null, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, null);
    //platform_require(file_handle != INVALID_HANDLE_VALUE);
    
    if (file_handle == INVALID_HANDLE_VALUE)
        return false;
    
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
        //platform_require(ok && (byte_count == write_byte_count));
        if (!ok || byte_count != write_byte_count)
            return false;
        
        memory.base  += byte_count;
        memory.count -= byte_count;
    }
    
    CloseHandle(file_handle);
    
    return true;
}

bool platform_allocate_and_read_entire_file(u8_array *out_data, cstring file_path)
{
    auto file_info = platform_get_file_info(file_path);
    if (!file_info.ok || file_info.is_directory)
        return false;
    
    u8_array data = platform_allocate_bytes(file_info.byte_count);
    data.count = file_info.byte_count; // since allocate will allocate more if it can (allocates multiple pages)
    platform_read_entire_file(data, file_path);
    
    *out_data = data;
    
    return true;
}

bool platform_allocate_and_read_entire_file(u8_array *out_data, memory_arena *memory, cstring file_path)
{
    auto file_info = platform_get_file_info(file_path);
    if (!file_info.ok || file_info.is_directory)
        return false;
        
    u8_array data;
    data.base  = allocate_bytes(memory, file_info.byte_count, 1);
    data.count = file_info.byte_count;
    bool ok = platform_read_entire_file(data, file_path);
    *out_data = data;
    
    return ok;
}

#define make_tail_next(pointer_to_first)   new_base_list((base_single_list_entry **) (pointer_to_first))
#define append_tail_next(tail_next, entry) append_base_list(tail_next, (base_single_list_entry *) (entry))

#define begin_list(list)         begin_base_list((base_single_list *) (list))
#define append_list(list, entry) append_base_list(&((base_single_list *) (list))->tail_next, (base_single_list_entry *) (entry))

base_list_tail_next new_base_list(base_single_list_entry **first)
{
    assert(first && !*first);
    return (base_list_tail_next) first;
}

void begin_base_list(base_single_list *list)
{
    list->first = null;
    list->tail_next = &list->first;
}

void append_base_list(base_single_list_entry ***tail_next, base_single_list_entry *entry)
{
    assert(!entry->next);
    **tail_next = entry;
    *tail_next = &entry->next;
}

union vec2s
{
    struct
    {
        s32 x, y;
    };
    
    s32 values[2];
};

union box2s
{
    struct
    {
        vec2s min, max;
    };
    
    vec2s extends[2];
};

box2s box2_size(s32 x, s32 y, s32 width, s32 height)
{
    return { x, y, x + width, y + height };
}