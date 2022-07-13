import string;

// this needs a unique name, otherwise everything will auto cast to lang_type_and_value
def print_value func(type_and_value lang_type_and_value)
{
    if type_and_value.type.indirection_count 
    {
        print("0x");
        print_hex(type_and_value.value cast(u64));
        return;
    }

    switch type_and_value.type.base_type . ;
    case lang_type_info_type.number
    {
        var number_type = type_and_value.type.base_type cast(lang_type_info_number ref);
        if number_type.is_float
        {
            var value f64;
            switch number_type.byte_count;
            case 4
                { value = type_and_value.value cast(f32 ref) . ; }
            case 8
                { value = type_and_value.value cast(f64 ref) . ; }
            else
                { ; }
        
            print_f64(value);
        }
        else if number_type.is_signed
        {
            var value s64;
            switch number_type.byte_count;
            case 1
                { value = type_and_value.value cast(s8 ref) . ; }
            case 2
                { value = type_and_value.value cast(s16 ref) . ; }
            case 4
                { value = type_and_value.value cast(s32 ref) . ; }
            case 8
                { value = type_and_value.value cast(s64 ref) . ; }
            else
                { ; }
        
            print_s64(value);
        }
        else 
        {
            var value u64;
            switch number_type.byte_count;
            case 1
                { value = type_and_value.value cast(u8 ref) . ; }
            case 2
                { value = type_and_value.value cast(u16 ref) . ; }
            case 4
                { value = type_and_value.value cast(u32 ref) . ; }
            case 8
                { value = type_and_value.value cast(u64 ref) . ; }
            else
                { ; }
        
            print_u64(value);
        }
    }
    case lang_type_info_type.array
    {
        var array_type = type_and_value.type.base_type cast(lang_type_info_array ref);
        if type_and_value.type.name is "string"
        {
            print("/"");
            print(type_and_value.value cast(string ref) . );
            print("/"");
        }
        else
        {
            var value = type_and_value.value cast(u8[] ref) . ;
            var item_type_and_value lang_type_and_value;
            item_type_and_value.type = array_type.item_type;
            
            print("[ ");
            loop var i; value.count
            {
                item_type_and_value.value = type_and_value.value + item_type_and_value.type.byte_count * i;
                print_value(item_type_and_value);
                print("; ");
            }
            print("]");
        }
    }
    else
    {
        ;
    }
}

def print func(format string; location = get_call_location(); values expand lang_type_and_value[])
{
    var value_index usize = 0;
    var count usize = 0;
    while count < format.count
    {
        var character = format[count];
        count = count + 1;
        
        switch character;
        case "\\"[0]
        {
            count = count + 1;
        }
        case "%"[0]
        {
            var text string = { count - 1; format.base };
            print(text);
            format.base  = format.base + count;
            format.count = format.count - count;
            count = 0;
        
            print_value(values[value_index]);
            value_index = value_index + 1;
        }
    }
    
    if count
    {
        var text string = { count; format.base };
        print(text);
    }

    //assert(value_index is values.count, location, "too many values passed to print");
}

def print_expression func(type_and_value lang_type_and_value; text = get_call_argument_text(type_and_value))
{
    print(text);
    print(" = ");
    print_value(type_and_value);
}

var x u8 = 12;
var args = type(lang_type_and_value[]) [ x ];
print("x = %\n", args);

var arg2 = type(lang_type_and_value[]) [ x ref ];
print("x ref = %\n", arg2);

print_expression(x ref);