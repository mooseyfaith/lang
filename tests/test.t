import string;

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

print("FINAL BOSS: % says: x ref = %, %\n", "fred", x ref, type(s32[]) [ 1; 4; 2 ]);

//print_expression((x - 2) * 2);

def foo func(x s32) (result s32)
{
    return x;
}
