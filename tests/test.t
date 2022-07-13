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
        if type_and_value.type.alias is "string"
        {
            //print("\"");
            print(type_and_value.value cast(string ref) . );
            //print("\"");
        }
        else
        {
            var value u8 ref;
            var item_type_and_value lang_type_and_value;
            item_type_and_value.type = array_type.item_type;
            
            var count usize;
            if array_type.item_count is 0
            {
                var array = type_and_value.value cast(u8[] ref) . ;
                count = array.count;
                value = array.base;
            }
            else
            {
                count = array_type.item_count;
                value = type_and_value.value;
            }
                
            print("[ ");
            loop var i; count
            {
                item_type_and_value.value = value + (item_type_and_value.type.byte_count * i);
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

var arg2 = type(lang_type_and_value[]) [ "fred"; x ref ];
print("% says: x ref = %\n", arg2);

var bla = type(s32[]) [ 1; 2; 3; 4; -12; ];
var arg3 = type(lang_type_and_value[]) [ "fred"; x ref; bla ];
print("% says: x ref = %, %\n", arg3);

var blu s32[] = bla;
var arg4 = type(lang_type_and_value[]) [ "fred"; x ref; blu ];
print("% says: x ref = %, %\n", arg4);

//print_expression((x - 2) * 2);

def foo func(x s32) (result s32)
{
    return x;
}

def is func(left string; right string) (result b8)
{
    if left.count is_not right.count
        return false;
        
    loop var i; left.count
    {
        if left[i] is_not right[i]
        return false;
    }
    
    return true;
}