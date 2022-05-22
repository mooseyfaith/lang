#pragma once

#include <basic.h>

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

struct base_hash_table
{
    usize count;
    u8 **keys;
    u8 **values;
};

struct base_hash_table_iterator
{
    usize table_count_minus_one;
    usize slot;
    usize probe_step;
};

base_hash_table_iterator find_begin(usize table_count, u32 key_hash)
{
    assert(((table_count - 1) & table_count) == 0, "table count must be a power of 2");
    u32 slot = key_hash & (table_count - 1);
    
    return { table_count - 1, slot, 1 };
}

bool find_next(usize *slot, base_hash_table_iterator *iterator)
{
    if (iterator->probe_step > iterator->table_count_minus_one)
        return false;
    
    *slot = iterator->slot;
    
    iterator->slot = (iterator->slot + iterator->probe_step) & iterator->table_count_minus_one;
    iterator->probe_step++;
    
    return true;
}

#define hash_table_get_slot(slot, table, key) \
do { \
    auto _it = find_begin((table)->count, hash_of(key)); \
    while (find_next(&(slot), &_it)) \
    { \
        auto slot_key = (table)->values[(slot)]; \
        if (is_empty(slot_key) || (slot_key == key)) \
            break; \
    } \
    \
    auto slot_key = (table)->values[(slot)]; \
    if (!is_empty(slot_key) && (slot_key != key)) \
        (slot) = -1; \
} while(false)

u32 try_get_slot(hash_table_pointers *table, u8 *key)
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

u32 get_slot(hash_table_pointers *table, u8 *key)
{
    u32 slot = try_get_slot(table, key);
    assert(slot != -1);
    
    return slot;
}

hash_table_pointers_result get_or_add(hash_table_pointers *table, u8 *key)
{
    hash_table_pointers_result result = {};
    
    result.slot = get_slot(table, key);
    
    if (!table->keys[result.slot])
    {
        table->keys[result.slot] = key;
        result.is_new = true;
    }
    
    return result;
}
