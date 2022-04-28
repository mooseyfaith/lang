#pragma once

#include "basic.h"

struct hash_table_pointers_result
{
    u32 slot;
    bool is_new;
};

struct hash_table_pointers
{
    usize count;
    u8 **keys;
    u32 min_key_byte_count_power_of_two;
};

u32 hash_of(u8 *key, u32 min_key_byte_count_power_of_two)
{
    return (u32) (((usize) key) >> min_key_byte_count_power_of_two);
}

u32 get_slot(hash_table_pointers *table, u8 *key)
{
    assert(key);
    assert(((table->count - 1) & table->count) == 0, "table count must be a power of 2");
    
    u32 slot = hash_of(key, table->min_key_byte_count_power_of_two) & (table->count - 1);
    
    for (u32 probe_step = 1; probe_step < table->count; probe_step++)
    {
        if (!table->keys[slot] || (table->keys[slot] == key))
            return slot;
        
        slot = (slot + probe_step) & (table->count - 1);
    }
    
    return -1;
}

u8 * try_get(hash_table_pointers *table, u8 *key)
{
    u32 slot = get_slot(table, key);
    assert(slot != -1);
    
    return table->keys[slot];
}


u8 * get(hash_table_pointers *table, u8 *key)
{
    auto result = try_get(table, key);
    assert(result);
    
    return result;
}

hash_table_pointers_result get_or_add(hash_table_pointers *table, u8 *key)
{
    hash_table_pointers_result result = {};
    
    result.slot = get_slot(table, key);
    assert(result.slot != -1);
    
    if (!table->keys[result.slot])
    {
        table->keys[result.slot] = key;
        result.is_new = true;
    }
    
    return result;
}