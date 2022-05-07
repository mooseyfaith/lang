import platform;
import gl;

var platform platform_api;
platform_init(platform ref);

var window platform_api_window;
platform_window(platform ref, window ref, "tetris");

var gl gl_api;
gl_init(gl ref, platform ref);

gl_win32_window_init_1(window.device_context);
platform_require(wglMakeCurrent(window.device_context, gl.win32_context));

def vec2 struct
{ 
    var x f32;
    var y f32;
}
    

def v2 func(x f32; y f32) (result vec2)
{
    var vector vec2;
    vector.x = x;
    vector.y = y;
    
    return vector;
}

def box2 struct
{
    var min vec2;
    var max vec2;
}

def quad struct
{
    var box box2;
}

def box2_size func(min vec2; size vec2) (result box2)
{
    var box box2;
    box.min = min;
    box.max.x = min.x + size.x;
    box.max.y = min.y + size.y;
    
    return box;
}

var player_pos vec2;

while true
{
    if not platform_handle_messages(platform ref) 
    {
        break;
    }
    
    // 'D' - 'A'
    var move_x f32 = platform_key_is_active(platform, 0x44) - platform_key_is_active(platform, 0x41);
    player_pos.x = move_x / 1000 + player_pos.x;
    
    var window_size vec2s = platform_window_frame(platform ref, window ref);
    
    var quads quad[64];
    var quad_count;
    
    quads[quad_count].box = box2_size(player_pos, v2(1, 1));
    quad_count = quad_count + 1;
    
    glViewport(0, 0, window_size.x, window_size.y);
    glClearColor(0, 0, 0, 1);
    glClear(GL_COLOR_BUFFER_BIT);
    
    glBegin(GL_TRIANGLES);
    
    glColor3f(1, 0, 0);
    
    var i = 0;
    while i < quad_count
    {
        var box box2 = quads[i].box;
        
        glVertex2f(box.min.x, box.min.y);
        glVertex2f(box.max.x, box.min.y);
        glVertex2f(box.max.x, box.max.y);
        
        glVertex2f(box.min.x, box.min.y);
        glVertex2f(box.max.x, box.max.y);
        glVertex2f(box.min.x, box.max.y);
        
        i = i + 1;
    }
    
    //glColor3f(1, 0, 0);
    //glVertex2f(0, 0);
    
    //glColor3f(0, 1, 0);
    //glVertex2f(1, 0);
    
    //glColor3f(0, 0, 1);
    //glVertex2f(0, 1);
    
    glEnd();
    
    SwapBuffers(window.device_context);
}
