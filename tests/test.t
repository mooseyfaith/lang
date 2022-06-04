
def foo struct
{
    a s32;
    b s32;
}

def bar func(f foo ref)
{
    printf("%i\n", f.a);
}

var platform platform_api;
platform_init(platform ref);

var window platform_api_window;
platform_window(platform ref, window ref, "hello");

while true
{
    assert(window.handle);
    if not platform_handle_messages(platform ref)
    {
        break;
    }
    
    
}



