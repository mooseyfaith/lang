import platform;
import platform_win32;
import gl;

var platform platform_api;
platform_init(platform ref);

var window platform_window;
platform_window_init(platform ref, window ref, "tetris");

var gl gl_api;
gl_init(gl ref, platform ref, true);

gl_window_init(platform ref, gl ref, window ref);

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
    bricks vec2s[4];
    type piece_type;
}

//def piece_type_colors = type(rgba32[piece_type.count]) // piece_type.count
def piece_type_colors = type(rgba32[]) // piece_type.count
{
    { 1.0; 0.0; 0.0; 1.0 };
    { 0.0; 1.0; 0.0; 1.0 };
    { 0.0; 0.0; 1.0; 1.0 };
    { 1.0; 1.0; 1.0; 1.0 };
    { 1.0; 1.0; 1.0; 1.0 };
    { 1.0; 1.0; 1.0; 1.0 };
    { 1.0; 1.0; 1.0; 1.0 };
    { 1.0; 1.0; 1.0; 1.0 }
};

var board piece_type[10][24]; // or [24][10]piece_type ?
var next_piece piece_type;

var piece falling_piece = make_piece(piece_type.i, board[0].count, board.count);

var tick_timeout f32 = 1;

platform_update_time(platform ref); // skip startup time

var game_over b32 = false;

while true
{
    if not platform_handle_messages(platform ref) 
    {
        break;
    }
    
    var delta_seconds f32 = platform.delta_seconds * 4;
    tick_timeout = tick_timeout - delta_seconds;
    
    // 'D' - 'A'
    // var move_x f32 = platform_key_is_active(platform, 0x44) - platform_key_is_active(platform, 0x41);
    // player_pos.x = move_x / 1000 + player_pos.x;
    
    if game_over
    {
        if platform_key_was_pressed(platform, 13) // enter
        {
            game_over = false;
            
            // board = piece_type.empty; like this?
            
            loop var y; board.count
            {
                loop var x; board[0].count
                {
                    board[y][x] = piece_type.empty;
                }
            }
            
            piece = make_piece(piece_type.i, board[0].count, board.count);
            tick_timeout = 1;
            continue;
        }
    }
    else
    {
        while tick_timeout <= 0
        {
            tick_timeout = tick_timeout + 1;
            
            var piece_did_fall b32 = false;
            loop var i; piece.bricks.count
            {
                var y = piece.bricks[i].y - 1;
                
                var a b32 = y < 0;
                var b b32 = board[y][piece.bricks[i].x] is_not piece_type.empty;
                if a or b
                {
                    piece_did_fall = true;
                    break;
                }
            }
            
            if piece_did_fall
            {
                loop var i; piece.bricks.count
                {
                    var brick vec2s = piece.bricks[i];
                    
                    if board[brick.y][brick.x] is_not piece_type.empty
                    {
                        game_over = true;
                        break;
                    }
                    
                    board[brick.y][brick.x] = piece.type;
                }
                
                if game_over { break; }
                
                piece = make_piece(piece_type.i, board[0].count, board.count);
            }
            else
            {
                loop var i; piece.bricks.count
                {
                    piece.bricks[i].y = piece.bricks[i].y - 1;
                }
            }
        }
    }
    
    var window_size vec2s = platform_window_frame(platform ref, window ref);
    var window_width_over_height f32 = window_size.x cast(f32) / window_size.y cast(f32);
    
    // * 2 since gl is [-1, 1] in both dimensions
    var viewport_scale vec2 = v2(2 / window_width_over_height, 2);
    
    var quads quad[64];
    var quad_count;
    
    var brick_size f32 = 0.025;
    
    loop var y; board.count
    {
        loop var x; board[0].count
        {
            var type piece_type = board[y][x];
            if type is_not piece_type.empty
            {
                quads[quad_count].box   = box2_size(v2(x * brick_size, y * brick_size), v2(brick_size, brick_size));
                quads[quad_count].color = piece_type_colors[type];
                quad_count = quad_count + 1;
            }
        }
    }
    
    loop var i; piece.bricks.count
    {
        var brick vec2s = piece.bricks[i];
        
        quads[quad_count].box   = box2_size(v2(brick.x * brick_size, brick.y * brick_size), v2(brick_size, brick_size));
        quads[quad_count].color = piece_type_colors[piece.type];
        quad_count = quad_count + 1;
    }
    
    glViewport(0, 0, window_size.x, window_size.y);
    glClearColor(0, 0, 0, 1);
    glClear(GL_COLOR_BUFFER_BIT);
    
    glBegin(GL_TRIANGLES);
    
    loop var i; quad_count
    {
        var q quad = quads[i];        
        var box box2 = q.box;
        
        glColor4f(q.color.values[0], q.color.values[1], q.color.values[2], q.color.values[3]);
        
        glVertex2f(box.min.x * viewport_scale.x - 1, box.min.y * viewport_scale.y - 1);
        glVertex2f(box.max.x * viewport_scale.x - 1, box.min.y * viewport_scale.y - 1);
        glVertex2f(box.max.x * viewport_scale.x - 1, box.max.y * viewport_scale.y - 1);
        
        glVertex2f(box.min.x * viewport_scale.x - 1, box.min.y * viewport_scale.y - 1);
        glVertex2f(box.max.x * viewport_scale.x - 1, box.max.y * viewport_scale.y - 1);
        glVertex2f(box.min.x * viewport_scale.x - 1, box.max.y * viewport_scale.y - 1);
    }
    
    glEnd();
    
    SwapBuffers(window.device_context);
}

def make_piece func(type piece_type; board_width s32; board_height s32) (result falling_piece)
{
    var piece falling_piece;
    piece.type = type;
    
    switch type
    case piece_type.i
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
    x f32;
    y f32;
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
    min vec2;
    max vec2;
}

def rgba32 struct
{
    values f32[4];
}

def quad struct
{
    box   box2;
    color rgba32;
}

def box2_size func(min vec2; size vec2) (result box2)
{
    var box box2;
    box.min = min;
    box.max.x = min.x + size.x;
    box.max.y = min.y + size.y;
    
    return box;
}
