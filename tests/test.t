
def bla struct
{
    x f32;
    y f32;
}

def bar struct
{
    b bla[100];
}

def ax type bla[];

def foo func(x u8 ref)
{
}

def print func(text string)
{
    printf("%.*s\0".base cast(cstring), text.count cast(s32), text.base cast(cstring));
}

def print func(value u64)
{
    printf("%llu\0".base cast(cstring), value);
}

def print_indent func(count u32)
{
    loop var i; count
    {
        print("    ");
    }
}

def print func(type_info lang_type_info; expand_next = false; expand = true; depth u32 = 0)
{
    print(type_info.alias);
        
    if not type_info.alias.count or expand
    {
        expand = expand_next;
        
        switch type_info.base_type.;
        case lang_type_info_type.number
        {
        }
        case lang_type_info_type.compound
        {
            var compound = type_info.base_type cast(lang_type_info_compound ref);
            
            if type_info.alias.count
                { print(" "); }
            
            print("compound {\n");
            
            loop var i; compound.fields.count
            {
                print_indent(depth + 1);
                print(compound.fields[i].name);
                print(" ");
                print(compound.fields[i].type, expand_next, expand, depth + 1);
                print(";\n");
            }
            
            print_indent(depth);
            print("}");
        }
        case lang_type_info_type.array
        {
            var array = type_info.base_type cast(lang_type_info_array ref);
            
            if type_info.alias.count
                { print(" "); }
            
            print(array.item_type, expand_next, expand, depth);
            
            print("[");
            
            if array.item_count
                { print(array.item_count); }
                
            print("]");
        }
        else
        {
            print("(unhandled)");
        }
    }
    
    while type_info.indirection_count
        { print(" ref"); }
}

var a = type(f32[]) [ 1; 2; 3; 4 ];
var b f32[] = a;
var byte_count u32 = 12;
//a.base = a.base + byte_count;

var t = get_type_info(bla).base_type cast(lang_type_info_compound ref);

print(get_type_info(bar), true); print("\n");
print(get_type_info(ax)); print("\n");

var z  = t.fields.count;
