
def bla struct
{
    x f32;
    y f32;
}

def bar struct
{
    b bla[100];
}

def foo func(x u8 ref)
{
}

var a = type(f32[]) [ 1; 2; 3; 4 ];
var b f32[] = a;
var byte_count u32 = 12;
//a.base = a.base + byte_count;

var x bla[100 * a.count];

foo(x.base);