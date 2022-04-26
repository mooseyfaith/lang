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

void skip_set(string *iterator, string set)
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
}

string skip_until_set(string *iterator, string set, bool do_skip_set = false)
{
    usize count = 0;    
    while (count < iterator->count)
    {
        u8 head = iterator->base[count];
        
        if (contains(set, head))
        {
            string result = skip(iterator, count);
            
            if (do_skip_set)
                skip_set(iterator, set);
                
            return result;
        }

        count++;
    }
    
    // return everything
    return skip(iterator, count);
}

void skip_white(string *iterator)
{
    skip_set(iterator, s(" \t\n\r"));
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