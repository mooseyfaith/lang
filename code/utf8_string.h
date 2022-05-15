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