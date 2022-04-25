import platform;

var x = 12;
if x {
    x = 41;
}
printf("fun %i", x);

switch x
{
    ?
    {
        printf("default\n");
    }
    
    41
    {
        printf("41!\n");
    }
    
    12
    {
        printf("no way\n");
    }
}

var platform platform_api;
platform_init(platform ref);

var window platform_api_window;
platform_window(platform ref, window ref, "test");

while true
{
    platform_handle_messages(platform ref);
}