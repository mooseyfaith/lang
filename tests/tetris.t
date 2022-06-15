import platform;
import platform_win32;
import gl;
import random;
import math;

var platform platform_api;
platform_init(platform ref);

var window platform_window;
platform_window_init(platform ref, window ref, "tetris\0", 1280, 720);

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
    s;
}

def falling_piece struct
{
    bricks vec2s[4];
    type piece_type;
}

//def piece_type_colors = type(rgba32[piece_type.count]) // piece_type.count
def piece_type_colors = type(rgba32[]) // piece_type.count
{
    { 0.0; 0.0; 0.0; 1.0 };
    { 1.0; 0.0; 0.0; 1.0 };
    { 0.0; 1.0; 0.0; 1.0 };
    { 0.0; 0.0; 1.0; 1.0 };
    { 1.0; 1.0; 0.0; 1.0 };
    { 1.0; 0.0; 1.0; 1.0 };
    { 0.0; 1.0; 1.0; 1.0 };
    { 0.3; 0.3; 1.0; 1.0 };
    { 0.3; 1.0; 0.3; 1.0 }
};

platform_update_time(platform ref); // skip startup time

var random random_pcg;
var filetime FILETIME;
GetSystemTimeAsFileTime(filetime ref);
random = filetime ref cast(u64 ref) . ;

var tick_timeout f32 = 1;
var board piece_type[10][24]; // or [24][10]piece_type ?
var piece      = make_random_piece(random ref, board[0].count, board.count);
var next_piece = make_random_piece(random ref, board[0].count, board.count);

var game_over b32 = false;

var pos = add(type(vec2) { 0; 1 }, type(vec2) { 1; 1 });

while true
{
    if not platform_handle_messages(platform ref)
    {
        break;
    }
    
    if game_over
    {
        tick_timeout = tick_timeout + (platform.delta_seconds * board.count * 2);
    
        if platform_key_was_pressed(platform, platform_key.enter)
        {
            game_over = false;
            
            loop var y; board.count
            {
                loop var x; board[0].count
                {
                    board[y][x] = piece_type.empty;
                }
            }
            
            piece      = make_random_piece(random ref, board[0].count, board.count);
            next_piece = make_random_piece(random ref, board[0].count, board.count);
            tick_timeout = 1;
            continue;
        }
    }
    else
    {
        tick_timeout = tick_timeout - (platform.delta_seconds * 8);
    
        var move_x s32 = platform_key_was_pressed(platform, "D"[0]) - platform_key_was_pressed(platform, "A"[0]);
        
        if move_x is_not 0
        {
            var piece_can_move b32 = true;
            loop var i; piece.bricks.count
            {
                var brick = piece.bricks[i];
                brick.x = brick.x + move_x;
                
                if (brick.x < 0) or (brick.x >= board[0].count)
                {
                    piece_can_move = false;
                    break;
                }
                
                if board[brick.y][brick.x] is_not piece_type.empty
                {
                    piece_can_move = false;
                    break;
                }
            }
            
            if piece_can_move
            {
                loop var i; piece.bricks.count
                {
                    piece.bricks[i].x = piece.bricks[i].x + move_x;
                }
            }
        }
        
        while tick_timeout <= 0
        {
            tick_timeout = tick_timeout + 1;
            
            var piece_did_fall b32 = false;
            loop var i; piece.bricks.count
            {
                var y = piece.bricks[i].y - 1;
                
                if (y < 0) or (board[y][piece.bricks[i].x] is_not piece_type.empty)
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
                    board[brick.y][brick.x] = piece.type;
                }
                
                loop var i; piece.bricks.count
                {
                    var brick vec2s = piece.bricks[i];
                    if brick.y >= (board.count - 4)
                    {
                        game_over = true;
                        break;
                    }
                }
                    
                if game_over
                { 
                    tick_timeout = 0;
                    break;
                }
                
                piece = next_piece;
                next_piece = make_random_piece(random ref, board[0].count, board.count);
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
    var viewport_scale = v2(2 / window_width_over_height, 2);
    
    var quads quad_buffer;
    quads.brick_size    = viewport_scale[1] / (2 * board.count + 10);
    quads.camera_offset = v2(0, quads.brick_size * 2.5);
    
    var stone_lines u32;
    if game_over
        { stone_lines = tick_timeout cast(u32); }
    
    loop var y; board.count
    {
        loop var x; board[0].count
        {
            var type piece_type = board[y][x];
            if type is_not piece_type.empty
            { 
                var color = piece_type_colors[type];
                if y < stone_lines
                    { color = type(rgba32) { 0.2; 0.2; 0.2; 1.0 }; }
            
                push_brick(quads ref, x, y, color); 
            }
        }
    }
    
    if not game_over
    {
        loop var i; piece.bricks.count
        {
            var brick vec2s = piece.bricks[i];
            
            push_brick(quads ref, brick.x, brick.y, piece_type_colors[piece.type]);
        }
    }
    
    loop var i; next_piece.bricks.count
    {
        var brick vec2s = next_piece.bricks[i];
        
        push_brick(quads ref, brick.x - 10, brick.y, piece_type_colors[next_piece.type]);
    }
    
    def frame_color = type(rgba32) { 0.8; 0.8; 0.8; 1.0 };
    
    loop var i; board[0].count + 2
    {
        push_brick(quads ref, i - 1, -1, frame_color);
    }
    
    loop var i; board.count
    {
        var color = frame_color;
        
        if i >= (board.count - 4)
            { color = type(rgba32) { 0.2; 0.2; 0.2; 1.0 }; }
        
        push_brick(quads ref, -1,             i, color);
        push_brick(quads ref, board[0].count, i, color);
    }
    
    glViewport(0, 0, window_size.x, window_size.y);
    glClearColor(0, 0, 0, 1);
    glClear(GL_COLOR_BUFFER_BIT);
    
    glBegin(GL_TRIANGLES);
    
    loop var i; quads.count
    {
        var q quad = quads.quads[i];        
        var box box2 = q.box;
        
        glColor4f(q.color[0], q.color[1], q.color[2], q.color[3]);
        
        glVertex2f(box.min[0] * viewport_scale[0], box.min[1] * viewport_scale[1]);
        glVertex2f(box.max[0] * viewport_scale[0], box.min[1] * viewport_scale[1]);
        glVertex2f(box.max[0] * viewport_scale[0], box.max[1] * viewport_scale[1]);
        
        glVertex2f(box.min[0] * viewport_scale[0], box.min[1] * viewport_scale[1]);
        glVertex2f(box.max[0] * viewport_scale[0], box.max[1] * viewport_scale[1]);
        glVertex2f(box.min[0] * viewport_scale[0], box.max[1] * viewport_scale[1]);
    }
    
    glEnd();
    
    SwapBuffers(window.device_context);
}

def make_piece func(type piece_type; board_width s32; board_height s32) (result falling_piece)
{
    var piece falling_piece;
    piece.type = type;
    
    switch type
    case piece_type.o
    {
        var x s32 = board_width / 2 - 1;
        piece.bricks[0].x = x;
        piece.bricks[0].y = board_height - 3;
        piece.bricks[1].x = x + 1;
        piece.bricks[1].y = board_height - 3;
        piece.bricks[2].x = x;
        piece.bricks[2].y = board_height - 4;
        piece.bricks[3].x = x + 1;
        piece.bricks[3].y = board_height - 4;
    }
    case piece_type.i
    {
        var x s32 = board_width / 2 - 1;
        piece.bricks[0].x = x;
        piece.bricks[0].y = board_height - 1;
        piece.bricks[1].x = x;
        piece.bricks[1].y = board_height - 2;
        piece.bricks[2].x = x;
        piece.bricks[2].y = board_height - 3;
        piece.bricks[3].x = x;
        piece.bricks[3].y = board_height - 4;
    }
    case piece_type.t
    {
        var x s32 = board_width / 2 - 1;
        piece.bricks[0].x = x;
        piece.bricks[0].y = board_height - 2;
        piece.bricks[1].x = x;
        piece.bricks[1].y = board_height - 3;
        piece.bricks[2].x = x;
        piece.bricks[2].y = board_height - 4;
        piece.bricks[3].x = x + 1;
        piece.bricks[3].y = board_height - 3;
    }
    case piece_type.l
    {
        var x s32 = board_width / 2 - 1;
        piece.bricks[0].x = x;
        piece.bricks[0].y = board_height - 2;
        piece.bricks[1].x = x;
        piece.bricks[1].y = board_height - 3;
        piece.bricks[2].x = x;
        piece.bricks[2].y = board_height - 4;
        piece.bricks[3].x = x + 1;
        piece.bricks[3].y = board_height - 4;
    }
    case piece_type.j
    {
        var x s32 = board_width / 2;
        piece.bricks[0].x = x;
        piece.bricks[0].y = board_height - 2;
        piece.bricks[1].x = x;
        piece.bricks[1].y = board_height - 3;
        piece.bricks[2].x = x;
        piece.bricks[2].y = board_height - 4;
        piece.bricks[3].x = x - 1;
        piece.bricks[3].y = board_height - 4;
    }
    case piece_type.z
    {
        var x s32 = board_width / 2 - 1;
        piece.bricks[0].x = x - 1;
        piece.bricks[0].y = board_height - 3;
        piece.bricks[1].x = x;
        piece.bricks[1].y = board_height - 3;
        piece.bricks[2].x = x;
        piece.bricks[2].y = board_height - 4;
        piece.bricks[3].x = x + 1;
        piece.bricks[3].y = board_height - 4;
    }
    case piece_type.s
    {
        var x s32 = board_width / 2 - 1;
        piece.bricks[0].x = x + 1;
        piece.bricks[0].y = board_height - 3;
        piece.bricks[1].x = x;
        piece.bricks[1].y = board_height - 3;
        piece.bricks[2].x = x;
        piece.bricks[2].y = board_height - 4;
        piece.bricks[3].x = x - 1;
        piece.bricks[3].y = board_height - 4;
    }
    else
    {
        assert(false);
    }
    
    return piece;
}

def make_random_piece func(random random_pcg ref; board_width s32; board_height s32) (result falling_piece)
{
    var type = (random_index(random, piece_type.count - 1) + 1) cast(piece_type);
    return make_piece(type, board_width, board_height);
}

def quad_buffer struct
{
    quads quad[1024];
    count u32;
    
    brick_size    f32;
    camera_offset vec2;
}

def push_brick func(buffer quad_buffer ref; x f32; y f32; color rgba32; location code_location = get_call_location())
{
    var margin = 0.1 * buffer.brick_size;
    var size   = buffer.brick_size - margin;
    
    push_quad(buffer, box2_size(v2((x - 4.5) * buffer.brick_size + margin - buffer.camera_offset[0], (y - 9.5) * buffer.brick_size + margin - buffer.camera_offset[1]), v2(size, size)), color, location);
}

def push_quad func(buffer quad_buffer ref; box box2; color rgba32; location code_location = get_call_location())
{
    assert(buffer.count < buffer.quads.count, location);
    buffer.quads[buffer.count].box   = box;
    buffer.quads[buffer.count].color = color;
    buffer.count = buffer.count + 1;
}


def v2 func(x f32; y f32) (result vec2)
{
    var vector vec2;
    vector[0] = x;
    vector[1] = y;
    
    return vector;
}

def box2 struct
{
    min vec2;
    max vec2;
}

def rgba32 type f32[4];

def quad struct
{
    box   box2;
    color rgba32;
}

def box2_size func(min vec2; size vec2) (result box2)
{
    var box box2;
    box.min = min;
    box.max[0] = min[0] + size[0];
    box.max[1] = min[1] + size[1];
    
    return box;
}