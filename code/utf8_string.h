#pragma once

#include "basic.h"

bool try_skip(string *iterator, string pattern)
{
    if (iterator->count < pattern.count)
        return false;
    
    string test = *iterator;
    test.count = pattern.count;
    
    if (test == pattern)
    {
        advance(iterator, pattern.count);
        
        return true;
    }
    else
    {
        return false;
    }
}

void skip(string *iterator, string pattern)
{
    bool ok = try_skip(iterator, pattern);
    assert(ok);
}

bool contains(string set, u8 code)
{
    for (usize i = 0; i < set.count; i++)
    {
        if (code == set.base[i])
            return true;
    }        
    
    return false;
}

bool try_skip_set(string *iterator, string set)
{
    usize count = 0;    
    while (count < iterator->count)
    {
        u8 head = iterator->base[count];
        
        if (!contains(set, head))
            break;

        count++;
    }
    
    advance(iterator, count);
    
    return (count > 0);
}

void skip_set(string *iterator, string set)
{
    bool ok = try_skip_set(iterator, set);
    assert(ok);
}


bool try_skip_until_set(string *result, string *iterator, string set, bool do_skip_set = false)
{
    usize count = 0;    
    while (count < iterator->count)
    {
        u8 head = iterator->base[count];
        
        if (contains(set, head))
        {
            *result = skip(iterator, count);
            
            if (do_skip_set)
                skip_set(iterator, set);
                
            return true;
        }

        count++;
    }
    
    return false;
}

string skip_until_set(string *iterator, string set, bool do_skip_set = false)
{
    string result;
    bool ok = try_skip_until_set(&result, iterator, set, do_skip_set);
    assert(ok);
    
    return result;
}

string skip_until_set_or_all(string *iterator, string set, bool do_skip_set = false)
{
    string result;
    if (!try_skip_until_set(&result, iterator, set, do_skip_set))
        return skip(iterator, iterator->count);
    else
        return result;
}

bool skip_white(string *iterator)
{
    return try_skip_set(iterator, s(" \t\n\r"));
}

bool is_digit(u8 code)
{
    return (u8) (code - '0') <= 9;
}

bool is_letter(u8 code)
{
    return ('a' <= code && code <= 'z') || ('A' <= code && code <= 'Z') || (code == '_');
}

string skip_name(string *iterator)
{
    if (!iterator->count || !is_letter(iterator->base[0]))
        return {};
    
    usize count = 1;
    while (count < iterator->count)
    {
        u8 head = iterator->base[count];
        if (!is_letter(head) && !is_digit(head))
            break;
        
        count++;
    }
    
    string result = skip(iterator, count);
    skip_white(iterator);
    
    return result;
}

bool starts_with(string text, string prefix)
{
    if (text.count < prefix.count)
        return false;
    
    text.count = prefix.count;
    return (text == prefix);
}


struct string_builder
{
    u8_buffer memory;
    
    u32 indent;
    bool previous_was_newline;
    bool previous_was_blank_line;
    bool previous_was_scope_open;
    bool previous_was_scope_close;
    bool pending_newline;
};

void print_raw_va(string_builder *builder, cstring format, va_list va_arguments)
{
    usize count = _vscprintf_p(format, va_arguments) + 1;

    auto offset = builder->memory.count;
    resize_buffer(&builder->memory, builder->memory.count + count);

    _vsprintf_p((char *) builder->memory.base + offset, count, format, va_arguments);
    resize_buffer(&builder->memory, builder->memory.count - 1); // without \0 terminal character
    
    builder->previous_was_newline    = false;
    builder->previous_was_blank_line = false;
}

void print_raw(string_builder *builder, cstring format, ...)
{
    va_list va_arguments;
    va_start(va_arguments, format);
    
    print_raw_va(builder, format, va_arguments);
    
    va_end(va_arguments);
}

void print_newline(string_builder *builder)
{
    print_raw(builder, "\r\n");
    builder->previous_was_blank_line = builder->previous_was_newline;
    builder->previous_was_newline = true;
    builder->pending_newline = false;
}

void print_va(string_builder *builder, cstring format, va_list va_arguments)
{
    if (builder->pending_newline)
        print_newline(builder);

    if (builder->previous_was_newline && builder->indent)
        print_raw(builder, "%*c", builder->indent * 4 - 1, ' ');

    auto debug_offset = builder->memory.count;
    print_raw_va(builder, format, va_arguments);
    
    // make sure no newline in format
    for (u32 i = debug_offset; i < builder->memory.count; i++)
    {
        u8 head = builder->memory.base[i];
        assert((head != '\r') && (head != '\n'));
    }
    
    builder->previous_was_newline    = false;
    builder->previous_was_blank_line = false;
    builder->previous_was_scope_open = false;
    builder->previous_was_scope_close = false;
}

void print(string_builder *builder, cstring format, ...)
{
    va_list va_arguments;
    va_start(va_arguments, format);
    
    print_va(builder, format, va_arguments);
    
    va_end(va_arguments);
}

void print_line(string_builder *builder, cstring format, ...)
{
    va_list va_arguments;
    va_start(va_arguments, format);
    
    print_va(builder, format, va_arguments);
    
    va_end(va_arguments);
    
    print_newline(builder);
}

void print_scope_open(string_builder *builder)
{
    if (!builder->previous_was_newline)
        print_newline(builder);
    
    print(builder, "{");
    builder->indent++;
    print_newline(builder);
    
    builder->previous_was_scope_open = true;
}

void maybe_print_newline(string_builder *builder)
{
    if (!builder->previous_was_newline)
        print_newline(builder);
}

void maybe_print_blank_line(string_builder *builder)
{
    if (!builder->previous_was_scope_open && !builder->previous_was_blank_line)
        print_newline(builder);
}

void pending_newline(string_builder *builder)
{
    builder->pending_newline = true;
}

void print_scope_close(string_builder *builder, bool with_newline = true)
{
    assert(builder->indent);
    
    --builder->indent;
    
    maybe_print_newline(builder);
    
    builder->pending_newline = false;
        
    print(builder, "}");
    
    if (with_newline)
        print_newline(builder);
        
    builder->previous_was_scope_close = true;
}
