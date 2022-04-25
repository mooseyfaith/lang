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

void skip_set(string *iterator, string set)
{
    usize count = 0;    
    while (count < iterator->count)
    {
        u8 head = iterator->base[count];
        bool found = false;       

        for (usize i = 0; i < set.count; i++)
        {
            if (head == set.base[i])
            {
                found = true;
                break;
            }
        }        

        if (!found)
            break;

        count++;
    }
    
    advance(iterator, count);
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