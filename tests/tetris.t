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

var player_pos vec2;

def piece_type enum 
{
    empty;
    o;
    i;
    t;
    l;
    j;
    z;
    n;
}

def falling_piece struct
{
    var bricks vec2s[4];
    var type piece_type;
}

var piece_type_colors rgba32[piece_type.count];
piece_type_colors[piece_type.o] = type(rgba32) { 1.0; 1.0; 1.0; 1.0 };

var board piece_type[20][10];
var next_piece piece_type;

var piece falling_piece = make_piece(piece_type.i, board[0].count, board.count);

var tick_timeout f32 = 1;

while true
{
    if not platform_handle_messages(platform ref) 
    {
        break;
    }
    
    var delta_seconds f32 = platform.delta_seconds;
    tick_timeout = tick_timeout - delta_seconds;
    
    // 'D' - 'A'
    var move_x f32 = platform_key_is_active(platform, 0x44) - platform_key_is_active(platform, 0x41);
    player_pos.x = move_x / 1000 + player_pos.x;
    
    while tick_timeout <= 0
    {
        tick_timeout = tick_timeout + 1;
        
        var piece_did_fall bool = false;
        loop var i; piece.bricks.count
        {
            var y = piece.bricks[i].y - 1;
            
            var a bool = y is 0;
            var b bool = board[y][piece.bricks[i].x] is_not pice_type_empty;
            if a or b
            {
                piece_did_fall = true;
                break;
            }
        }
        
        if piede_did_fall
        {
            loop var i; piece.bricks.count
            {
                var brick vec2s = piece.bricks[i];
                board[brick.y][brick.x] = piece.type;
            }
            
            piece = make_piece(piece_type_i, board[0].count, board.count);
        }
    }
    
    var window_size vec2s = platform_window_frame(platform ref, window ref);
    var window_width_over_height f32 = window_size.x / window_size.y;
    
    // * 2 since gl is [-1, 1] in both dimensions
    var viewport_scale vec2 = v2(2 * window_width_over_height, 2);
    
    var quads quad[64];
    var quad_count;
    
    var brick_size f32 = 0.1;
    
    loop var i; piece.bricks.count
    {
        var brick vec2 = piece.bricks[i];
        
        quads[quad_count].box   = box2_size(v2(brick.x * brick_scale, brick.y * brick_scale), v2(brick_scale, brick_scale));
        quads[quad_count].color = piece_type_colors[piece.type];
        quad_count = quad_count + 1;
    }
    
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
        
        glVertex2f(box.min.x * viewport_scale.x - 1, box.min.y * viewport_scale.y - 1);
        glVertex2f(box.max.x * viewport_scale.x - 1, box.min.y * viewport_scale.y - 1);
        glVertex2f(box.max.x * viewport_scale.x - 1, box.max.y * viewport_scale.y - 1);
        
        glVertex2f(box.min.x * viewport_scale.x - 1, box.min.y * viewport_scale.y - 1);
        glVertex2f(box.max.x * viewport_scale.x - 1, box.max.y * viewport_scale.y - 1);
        glVertex2f(box.min.x * viewport_scale.x - 1, box.max.y * viewport_scale.y - 1);
        
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

def make_piece func(type piece_type; board_width s32; board_height s32) (result falling_piece)
{
    var piece falling_piece;
    piece.type = type;
    
    switch type
    case piece_type_i
    {
        var x s32 = board_width / 2;
        piece.bricks[0].x = x;
        piece.bricks[0].y = board_height - 1;
        piece.bricks[1].x = x;
        piece.bricks[1].y = board_height - 2;
        piece.bricks[2].x = x;
        piece.bricks[2].y = board_height - 3;
        piece.bricks[3].x = x;
        piece.bricks[3].y = board_height - 4;
    }
    else
    {
        assert(false);
    }
    
    return piece;
}

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

def rgba32 struct
{
    var values f32[4];
}

def quad struct
{
    var box   box2;
    var color rgba32;
}

def box2_size func(min vec2; size vec2) (result box2)
{
    var box box2;
    box.min = min;
    box.max.x = min.x + size.x;
    box.max.y = min.y + size.y;
    
    return box;
}
