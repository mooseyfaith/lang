import platform;
import random;
import math;

var platform platform_api;
platform_init(platform ref);

var renderer render_api;
init(renderer ref, platform ref);

def piece_type enum u32
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

def piece_type_colors = type(rgba32[piece_type.count])
[
    {};
    { 255; 0; 0; 255 };
    { 0; 255; 0; 255 };
    { 0; 0; 255; 255 };
    { 255; 255; 0; 255 };
    { 255; 0; 255; 255 };
    { 0; 255; 255; 255 };
    { 255; 255; 255; 255 }
];

def frame_color = type(rgba32) { 80; 80; 80; 255 };

platform_update_time(platform ref); // skip startup time

var random = platform_get_random_from_time(platform ref);

var tick_timeout f32 = 1;
var board piece_type[10][24]; // or [24][10]piece_type ?
var piece      = make_random_piece(random ref, board[0].count, board.count);
var next_piece = make_random_piece(random ref, board[0].count, board.count);

var game_over b32 = false;
var jiggle_time f32;

while platform_handle_messages(platform ref)
{
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
    
    jiggle_time = fmod(jiggle_time + (platform.delta_seconds * 0.1), 1.0);
    var jiggle = sin(jiggle_time * 2 * pi32) * 0.05 * pi32;
    
    frame_begin(platform ref, renderer ref, jiggle);
    
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
                    { color = frame_color; }
            
                push_brick(renderer ref, x, y, color); 
            }
        }
    }
    
    if not game_over
    {
        loop var i; piece.bricks.count
        {
            var brick vec2s = piece.bricks[i];
            
            push_brick(renderer ref, brick.x, brick.y, piece_type_colors[piece.type]);
        }
    }
    
    loop var i; next_piece.bricks.count
    {
        var brick vec2s = next_piece.bricks[i];
        
        push_brick(renderer ref, brick.x - 10, brick.y, piece_type_colors[next_piece.type]);
    }
    
    loop var i; board[0].count + 2
    {
        push_brick(renderer ref, i - 1, -1, frame_color);
    }
    
    loop var i; board.count
    {
        var color = frame_color;
        
        if i >= (board.count - 4)
            { color = frame_color; }
        
        push_brick(renderer ref, -1,             i, color);
        push_brick(renderer ref, board[0].count, i, color);
    }
    
    present(platform ref, renderer ref);
}

def make_piece func(type piece_type; board_width s32; board_height s32) (result falling_piece)
{
    var piece falling_piece;
    piece.type = type;
    
    switch type;
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

def push_brick func(renderer render_api ref; x f32; y f32; color rgba32; location code_location = get_call_location())
{
    var margin = 0.1;
    var size   = 1.0 - margin;
    
    var min = v2(x, y) - v2(4.5, 9.5) + margin;
    push_quad(renderer, box2_size(min, v2(size)), color, location);
}

// short constructors

def v2 func(x f32; y f32) (result vec2)
{
    var result vec2 = [ x; y ];
    return result;
}

def v2 func(scale f32) (result vec2)
{
    var result vec2 = [ scale; scale ];
    return result;
}

def box2 struct
{
    min vec2;
    max vec2;
}

def box2_size func(min vec2; size vec2) (result box2)
{
    var box box2 = { min; min + size };
    return box;
}