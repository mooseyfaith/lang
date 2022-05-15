
def foo struct
{
    a s32;
    b s32;
}

def bar func(f foo ref)
{
    printf("%i\n", f.a);
}


