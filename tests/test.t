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

def state enum u32
{
    one;
    two = 8;
    tree;
}

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

var window platform_api_window;
platform_window(platform ref, window ref, "test");

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