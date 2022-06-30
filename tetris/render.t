
import math;
import gl;
import gl_win32;
import platform;

//def vertex_shader_source   = import_text_file("default.vert.glsl");
//def fragment_shader_source = import_text_file("default.frag.glsl");

def default_vertex struct
{
    position vec2;
    color    rgba32;
}

def rgba32 type f32[4];

def render_quad struct
{
    box   box2;
    color rgba32;
}

def render_api struct
{
    window platform_window;
    
    quads render_quad[1024];
    quad_count u32;
    
    window_size vec2s;
    viewport_scale vec2;
    camera_offset vec2;
    brick_size f32;
    window_width_over_height f32;
    
    gl gl_api;
    
    default_shader u32;
    
    vertex_array u32;
    vertex_buffer u32;
}

def init func(renderer render_api ref; platform platform_api ref)
{
    gl_init(renderer.gl ref, platform, true);
    
    platform_window_init(platform, renderer.window ref, "tetris\0", 1280, 720);
    gl_window_init(platform, renderer.gl ref, renderer.window ref);
    
    var buffer u8 [4096];
    var source = platform_read_entire_file(buffer, platform, "tetris/shaders/default.vert.glsl\0");
    require(source.base);
    
    var vertex_shader = create_shader_object(renderer.gl ref, false, source, "vertex_shader");
    require(vertex_shader);
    
    source = platform_read_entire_file(buffer, platform, "tetris/shaders/default.frag.glsl\0");
    require(source.base);
    
    var fragment_shader = create_shader_object(renderer.gl ref, true, source, "fragment_shader");
    require(fragment_shader);
        
    renderer.default_shader = create_program_begin(renderer.gl ref);
    
    glGenVertexArrays(1, renderer.vertex_array ref);
    
    var buffer_object u32;
    glGenBuffers(1, renderer.vertex_buffer ref);
    
    glBindVertexArray(renderer.vertex_array);
    glBindBuffer(GL_ARRAY_BUFFER, buffer_object);
    
    glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE, type_byte_count(default_vertex), 0 cast(u8 ref));
    glEnableVertexAttribArray(0);
    
    glVertexAttribPointer(1, 4, GL_UNSIGNED_BYTE, GL_TRUE, type_byte_count(default_vertex), type_byte_count(vec2) cast(u8 ref));
    glEnableVertexAttribArray(1);
    
    glBufferData(GL_ARRAY_BUFFER, type_byte_count(default_vertex) * 6 * renderer.quads.count, null, GL_DYNAMIC_DRAW);
    
    glBindVertexArray(renderer.vertex_array);
}

def frame_begin func(platform platform_api ref; renderer render_api ref; board_height s32)
{
    renderer.window_size = platform_window_frame(platform, renderer.window ref);
    renderer.window_width_over_height = renderer.window_size.x cast(f32) / renderer.window_size.y cast(f32);
    renderer.viewport_scale = v2(2.0 / renderer.window_width_over_height, 2.0);
    renderer.brick_size    = renderer.viewport_scale[1] / (2 * board_height + 10);
    renderer.camera_offset = v2(0, renderer.brick_size * 2.5);
}

def present func(platform platform_api ref; renderer render_api ref)
{
    glViewport(0, 0, renderer.window_size.x, renderer.window_size.y);
    glClearColor(0, 0, 0, 1);
    glClear(GL_COLOR_BUFFER_BIT);
    
    var vertices default_vertex[renderer.quads.count * 6];
    var vertex_count;
    
    loop var i; renderer.quad_count
    {
        var quad = renderer.quads[i];        
        
        var box box2 = quad.box;
        var min = scale(box.min, renderer.viewport_scale);
        var max = scale(box.max, renderer.viewport_scale);
        
        assert(vertex_count + 6 <= vertices.count);
        var quad_vertices default_vertex[] = { 6; vertices.base + vertex_count };
        vertex_count = vertex_count + 6;
        
        // 1st triangle
        
        quad_vertices[0].color = quad.color;
        quad_vertices[0].position[0] = min[0];
        quad_vertices[0].position[1] = min[1];
        
        quad_vertices[1].color = quad.color;
        quad_vertices[1].position[0] = max[0];
        quad_vertices[1].position[1] = min[1];
        
        quad_vertices[2].color = quad.color;
        quad_vertices[2].position[0] = max[0];
        quad_vertices[2].position[1] = max[1];
        
        // 2nd triangle
        
        quad_vertices[3] = quad_vertices[0];
        quad_vertices[4] = quad_vertices[2];
        
        quad_vertices[5].color = quad.color;
        quad_vertices[5].position[0] = min[0];
        quad_vertices[5].position[1] = max[1];
    }
    
    // upload
    // TODO: use glMapBuffer
    glBindBuffer(GL_ARRAY_BUFFER, renderer.vertex_buffer);
    glBufferSubData(GL_ARRAY_BUFFER, 0, type_byte_count(default_vertex) * vertex_count, vertices.base);
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    
    glUseProgram(renderer.default_shader);
    
    glBindVertexArray(renderer.vertex_array);
    
    glDrawArrays(GL_TRIANGLES, 0, vertex_count);
    
    gl_window_present(platform, renderer.gl ref, renderer.window ref);
    
    renderer.quad_count = 0;
}

def push_quad func(renderer render_api ref; box box2; color rgba32; location code_location = get_call_location())
{
    assert(renderer.quad_count < renderer.quads.count, location);
    renderer.quads[renderer.quad_count].box   = box;
    renderer.quads[renderer.quad_count].color = color;
    renderer.quad_count = renderer.quad_count + 1;
}