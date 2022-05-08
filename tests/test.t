import platform;

def day enum
{
    monday;
    tuesday;
    wednesday;
    thursday;
    friday;
    saturday;
    sunday;
}

def foo func(name GLchar ref; count GLint)
{
}

def bar func(name GLchar ref);
var global bardaband bar;

def my_bar func bar
{
}

def GLint type s32;
def GLchar type u8;

def state enum u32
{
    one;
    two = 8;
    tree;
}

def indices = type(s32[]) { 1; 2; 3; 4 };
// todo: support array literals in C
//var indices2 s32[] = { 5; 6; 7; 8 };

printf("day: %i of %i", day.monday, day.count);

var x = 12;
if x {
    x = 41;
}
printf("fun %i\n", x);

switch x
case 41
{
    printf("41!\n");
}
case 12
{
    printf("no way\n");
}
else
{
    printf("default\n");
}

var platform platform_api;
platform_init(platform ref);

var window platform_api_window;
platform_window(platform ref, window ref, "test");

// new feature to get the condition expression inside the if/switch
if x is 12
{
    var r;// branch_expression; // x is 12
}
// or
// if var r = x is 12 { ... }

assert(false);

while true
{
    if not platform_handle_messages(platform ref) 
    {
        break;
    }
}

printf("we are done here!");

def swap func(a s32; b s32) (old_b s32; old_a s32)
{
    return b, a;
}