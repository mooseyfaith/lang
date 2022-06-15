
def foo func(a s32; b s32) (result s32)
{
    return 1;
}

def foo func(a string) (result string)
{
    return a;
}

var x = foo(1, 2);
var y = foo("test");