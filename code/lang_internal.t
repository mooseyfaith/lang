
module lang;

def usize type u64;
def ssize type s64; 

def b8  type u8; 
def b32 type u32; 

def string type u8[]; 

def cstring type u8 ref; 

def null  = 0 cast(u8 ref);
def false = 0 cast(b8);
def true  = 1 cast(b8);

def code_location struct 
{ 
    module   string; 
    file     string; 
    function string; 
    line     u32; 
    column   u32; 
} 

def lang_type_info_type enum u32
{
    number;
    compound;
    function;
    array;
    enumeration;
    
    compound_field;
    enumeration_item;
}

def lang_type_info struct
{
    base_type         lang_type_info_type ref;
    alias             string;
    indirection_count u32;
    byte_count        u32;
    byte_alignment    u32;
}

def lang_type_info_number_type enum u32
{
    u8;
    u16;
    u32;
    u64;
    
    s8;
    s16;
    s32;
    s64;
    
    f32;
    f64;
}

def lang_type_info_number struct
{
    base_type   lang_type_info_type;
    number_type lang_type_info_number_type;
    byte_count  u32; // also alignment
    is_float    b8;
    is_signed   b8;
}

def lang_type_info_compound struct
{
    base_type      lang_type_info_type;
    fields         lang_type_info_compound_field[];
    byte_count     u32;
    byte_alignment u32;
}

def lang_type_info_compound_field struct
{
    base_type      lang_type_info_type;
    type           lang_type_info;
    name           string;
    byte_offset    u32;
}

def lang_type_info_array struct
{
    base_type  lang_type_info_type;
    item_type  lang_type_info;
    
    // 0 means is not fixed size
    item_count usize;
    byte_count usize;
}

def lang_type_info_enumeration struct
{
    base_type  lang_type_info_type;
    item_type  lang_type_info;
    items      lang_type_info_enumeration_item[];
}

def lang_type_info_enumeration_item struct
{
    base_type  lang_type_info_type;
    name       string;
    value      u64;
}

def lang_type_info_any_value struct
{
    type  lang_type_info;
    value u8 ref;
}

// placeholders, arrays will be fixed size, not dynamic
def lang_type_info_table struct
{
    number_types           lang_type_info_number[];
    array_types            lang_type_info_array[];
//  function_types         lang_type_info_function[];
    compound_types         lang_type_info_compound[];
    compound_field_types   lang_type_info_compound_field[];
    
    enumerations_type      lang_type_info_enumeration[];
    enumeration_item_types lang_type_info_enumeration_item[];
}

def lang_type_table = type(lang_type_info_table) {};

def lang_variable_info struct
{
    type lang_type_info;
    name string;
    base u8 ref;
}

def lang_global_variables = type(lang_variable_info[]) [];

// placeholders, will be resized
//def lang_type_info_number_type_table           = type(lang_type_info_number[])           [];
//def lang_type_info_compound_type_table         = type(lang_type_info_compound[])         [];
//def lang_type_info_compound_type_field_table   = type(lang_type_info_compound_field[])   [];
//def lang_type_info_array_type_table            = type(lang_type_info_array[])            [];
//def lang_type_info_enumeration_type_table      = type(lang_type_info_enumeration[])      [];
//def lang_type_info_enumeration_type_item_table = type(lang_type_info_enumeration_item[]) [];