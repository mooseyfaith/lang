
#pragma once

typedef signed __int8  s8;
typedef signed __int16 s16;
typedef signed __int32 s32;
typedef signed __int64 s64;
typedef s64 ssize;

typedef unsigned __int8  u8;
typedef unsigned __int16 u16;
typedef unsigned __int32 u32;
typedef unsigned __int64 u64;
typedef u64 usize;

typedef float f32;

#define null 0

#define flag(index) ( 1 << (index) )

typedef char * cstring;

// C static array count
#define carray_count(static_array) ( sizeof(static_array) / sizeof((static_array)[0]) )

const f32 pi32 = 3.14159265358979323846;

struct u8_array
{
    usize count;
    u8   *base;
};

typedef u8_array string;

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
#define cases_complete        default: assert(false, "unhandled case");

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