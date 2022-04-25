#pragma once

#include <tk.h>

struct string_hash_table
{
    usize count;
    string *keys;
};

struct hash_table_result
{
    u32 slot;
    bool is_new;
};

u32 crc32_table[256];

void crc32_init()
{
    crc32_table[0] = 0;
    u32 crc = 1;
    u32 i = 128;
    
    do
    {
        if (crc & 1)
            crc = (crc >> 1) ^ 0x8408; // The CRC polynomial
        else 
            crc = crc >> 1;
            
        // crc is the value of crc32_table[i]; let j iterate over the already-initialized entries
        for (u32 j = 0; j < 256; j += i << 1)
            crc32_table[i + j] = crc ^ crc32_table[j];
        
        i >>= 1;
    } while (i > 0);
}

u32 hash_of(string text)
{
    assert(crc32_table[1], "crc32_table not init, run crc32_init first");

    // CRC-32
    u32 value = 0xFFFFFFFF;
    for (u32 i = 0; i < text.count; i++)
    {
        u32 index = (value ^ text.base[i]) & 255;
        value = (value >> 8) ^ crc32_table[index];
    }
    
    value = value ^ 0xFFFFFFFF;
    
    return value;
}

u32 get_slot(string_hash_table *table, string key)
{
    assert(key.count);
    assert(((table->count - 1) & table->count) == 0, "table count must be a power of 2");
    
    u32 slot = hash_of(key) & (table->count - 1);
    
    for (u32 probe_step = 1; probe_step < table->count; probe_step++)
    {
        if (!table->keys[slot].count || (table->keys[slot] == key))
            return slot;
        
        slot = (slot + probe_step) & (table->count - 1);
    }
    
    return -1;
}

hash_table_result get(string_hash_table *table, string key)
{
    hash_table_result result = {};
    
    result.slot = get_slot(table, key);
    assert(result.slot != -1);
    
    if (!table->keys[result.slot].count)
    {
        table->keys[result.slot] = key;
        result.is_new = true;
    }
    
    return result;
}
