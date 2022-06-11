
import platform;
import platform_win32;

def foo struct
{
    a s32;
    b s32;
    pos vec2;
}

def vec2 struct
{
    values f32[2];
}

def bar func(f foo ref)
{
    printf("%i\n", f.a);
}

def bartender func()
{
}

var platform platform_api;
platform_init(platform ref);

var window platform_window;
platform_window_init(platform ref, window ref, "hello", 640, 480);

while true
{
    assert(window.handle is_not null);
    if not platform_handle_messages(platform ref)
    {
        break;
    }
}
