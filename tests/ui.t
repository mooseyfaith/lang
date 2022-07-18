
import platform;
import gl;
import math;

def rgba8 type u8[4];

def ui_system struct
{
    memory memory_arena;
    handles    ui_handle[1024];
    tiles      ui_tile[1024];
    tile_count u32;
    
    gl_atlas_handle u32;
    atlas_width  s32;
    atlas_height s32;
    
    commands      ui_draw_command[1024];
    command_count u32;
}

def ui_handle struct
{
    id           u32;
    pixel_height u32;
}

def ui_tile struct
{
    x s32;
    y s32;
    width  s32;
    height s32;
};

def ui_draw_command struct
{
    tile_index u32;
    x          s32;
    y          s32;
}

def init func(ui ui_system ref; platform platform_api ref; gl gl_api ref)
{
    init(ui.memory ref);
    
    ui.atlas_width = 1024;
    ui.atlas_height = 1024;
    
    glGenTextures(1, ui.gl_atlas_handle ref);
    glBindTexture(GL_TEXTURE_2D, ui.gl_atlas_handle);
    
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8, ui.atlas_width, ui.atlas_height, 0, GL_RGBA, GL_UNSIGNED_BYTE, null);
    glBindTexture(GL_TEXTURE_2D, 0);
}

def rounded_box func(ui ui_system ref; handle ui_handle; box box2; corner_radius f32; color rgba8)
{
    var tile_index = -1 cast(u32);
    loop var i u32; ui.tile_count
    {
        if (ui.handles[i].id is handle.id) and (ui.handles[i].pixel_height is handle.pixel_height)
        {
            tile_index = i;
            break;
        }
    }

    if tile_index is -1
    {
        var size = box.max - box.min;
        var width  = (size[0] + 1) cast(s32);
        var height = (size[1] + 1) cast(s32);
        
        tile_index = ui.tile_count;
        ui.handles[tile_index] = handle;
        var tile = ui.tiles[tile_index] ref;
        ui.tile_count = ui.tile_count + 1;
        tile.x = 0;
        tile.y = 0;
        tile.width = width;
        tile.height = height;
        
        var pixels rgba8[];
        pixels.count = (width * height) cast(usize);
        pixels.base = allocate_array(ui.memory ref, get_type_info(rgba8), pixels.count);
        
        loop var i; width * height
        {
            pixels[i] = type(rgba8) [ 0; 0; 0; 0];
        }
        
        var center vec2 = [ width; height ] * 0.5;
        
        loop var y; height
            loop var x; width
            {
                var p vec2 = [ x; y ];
                var d = 30 - length(p - center);
                if d < 0
                    continue;
            
                pixels[(y * width) + x] = color;
                
                if d < 1
                    pixels[(y * width) + x][3] = (d * 255) cast(u8);
            }
        
        glBindTexture(GL_TEXTURE_2D, ui.gl_atlas_handle);
        glTexSubImage2D(GL_TEXTURE_2D, 0, tile.x, tile.y, tile.width, tile.height, GL_RGBA, GL_UNSIGNED_BYTE, pixels.base);
        glBindTexture(GL_TEXTURE_2D, 0);
        
        free(ui.memory ref, pixels.base);
    }
    
    var command = ui.commands[ui.command_count] ref;
    ui.command_count = ui.command_count + 1;
    command.tile_index = tile_index;
    command.x = box.min[0] cast(s32);
    command.y = box.min[1] cast(s32);
}

def present func(ui ui_system ref; window_width s32; window_height s32)
{
    glEnable(GL_TEXTURE_2D);
    glBindTexture(GL_TEXTURE_2D, ui.gl_atlas_handle);
    
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);  
    
    glBegin(GL_TRIANGLES);
    
    glColor4f(1, 1, 1, 1);
    
    loop var i; ui.command_count
    {
        var command = ui.commands[i];
        var tile    = ui.tiles[command.tile_index];
        
        // first triangle
        glTexCoord2f(tile.x cast(f32) / ui.atlas_width, tile.y cast(f32) / ui.atlas_height);
        glVertex2f(2.0 * command.x / window_width - 1, 2.0 * (command.y) / window_height - 1);
        
        glTexCoord2f((tile.x + tile.width) cast(f32) / ui.atlas_width, tile.y cast(f32) / ui.atlas_height);
        glVertex2f(2.0 * (command.x + tile.width) / window_width - 1, 2.0 * (command.y) / window_height - 1);
        
        glTexCoord2f((tile.x + tile.width) cast(f32) / ui.atlas_width, (tile.y + tile.height) cast(f32) / ui.atlas_height);
        glVertex2f(2.0 * (command.x + tile.width) / window_width - 1, 2.0 * (command.y + tile.height) / window_height - 1);
        
        // second triangle
        glTexCoord2f(tile.x cast(f32) / ui.atlas_width, tile.y cast(f32) / ui.atlas_height);
        glVertex2f(2.0 * (command.x) / window_width - 1, 2.0 * (command.y) / window_height - 1);
        
        glTexCoord2f((tile.x + tile.width) cast(f32) / ui.atlas_width, (tile.y + tile.height) cast(f32) / ui.atlas_height);
        glVertex2f(2.0 * (command.x + tile.width) / window_width - 1, 2.0 * (command.y + tile.height) / window_height - 1);
        
        glTexCoord2f(tile.x cast(f32) / ui.atlas_width, (tile.y + tile.height) cast(f32) / ui.atlas_height);
        glVertex2f(2.0 * (command.x) / window_width - 1, 2.0 * (command.y + tile.height) / window_height - 1);
    }
    
    glEnd();
    
    ui.command_count = 0;
}


var platform platform_api;
platform_init(platform ref);

var gl gl_api;
var backwards_compatible = true;
gl_init(gl ref, platform ref, backwards_compatible);

var window platform_window;
platform_window_init(platform ref, window ref, "window\0", 1280, 720);
gl_window_init(platform ref, gl ref, window ref);

var ui ui_system;
init(ui ref, platform ref, gl ref);

platform_update_time(platform ref); // skip startup time

while platform_handle_messages(platform ref)
{
    // update
    // ...
    
    rounded_box(ui ref, type(ui_handle) { 1; 1 }, type(box2) { type(vec2) [ 10; 10 ]; type(vec2) [ 100; 100 ]}, 10, type(rgba8) [ 255; 0; 0; 255 ]);
    
    // render
    
    var window_size vec2s = platform_window_frame(platform ref, window ref);
    var window_width_over_height f32 = window_size.x cast(f32) / window_size.y cast(f32);
    
    glViewport(0, 0, window_size.x, window_size.y);
    glClearColor(0, 0, 0, 1);
    glClear(GL_COLOR_BUFFER_BIT);
    
    present(ui ref, window_size.x, window_size.y);
    
    glBegin(GL_TRIANGLES);
    
    glColor4f(1, 0, 0, 1);
    glVertex2f(-0.5, -0.5 * window_width_over_height);
    
    glColor4f(0, 1, 0, 1);
    glVertex2f(0.5, -0.5 * window_width_over_height);
    
    glColor4f(0, 0, 1, 1);
    glVertex2f(0.0, 0.5 * window_width_over_height);
    
    glEnd();
    
    gl_window_present(platform ref, gl ref, window ref);
}