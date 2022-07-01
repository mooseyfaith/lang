
import math;
import gl;
import gl_win32;
import platform;

//def vertex_shader_source   = import_text_file("default.vert.glsl");
//def fragment_shader_source = import_text_file("default.frag.glsl");

def default_vertex struct
{
    position vec3;
    color    rgba32;
}

def rgba32 type u8[4];

def render_quad struct
{
    box   box2;
    color rgba32;
}

def mat_projection type mat4;
def mat_transform  type mat4;

def render_api struct
{
    window platform_window;
    
    quads render_quad[1024];
    quad_count u32;
    
    window_size              vec2s;
    window_width_over_height f32;
    
    gl gl_api;
    
    jiggle f32;
    camera_to_clip  mat_projection;
    camera_to_world mat_transform;
    world_to_camera mat_transform;
    
    default_shader u32;
    default_shader_object_to_clip_uniform s32;
    
    vertex_array u32;
    vertex_buffer u32;
}

def init func(renderer render_api ref; platform platform_api ref)
{
    gl_init(renderer.gl ref, platform);
    
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
    
    create_program_add_shader(renderer.gl ref, renderer.default_shader, vertex_shader);
    create_program_add_shader(renderer.gl ref, renderer.default_shader, fragment_shader);
    
    create_program_bind_attribute(renderer.gl ref, renderer.default_shader, 0, "vertex_position");
    create_program_bind_attribute(renderer.gl ref, renderer.default_shader, 1, "vertex_color");
    
    create_program_end(renderer.gl ref, renderer.default_shader);
    
    renderer.default_shader_object_to_clip_uniform = glGetUniformLocation(renderer.default_shader, "object_to_clip_projection\0".base cast(GLchar ref));
    
    glGenVertexArrays(1, renderer.vertex_array ref);
    
    glGenBuffers(1, renderer.vertex_buffer ref);
    
    glBindVertexArray(renderer.vertex_array);
    glBindBuffer(GL_ARRAY_BUFFER, renderer.vertex_buffer);
    
    glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE, type_byte_count(default_vertex), 0 cast(u8 ref));
    glEnableVertexAttribArray(0);
    
    glVertexAttribPointer(1, 4, GL_UNSIGNED_BYTE, GL_TRUE, type_byte_count(default_vertex), type_byte_count(vec3) cast(u8 ref));
    glEnableVertexAttribArray(1);
    
    glBufferData(GL_ARRAY_BUFFER, type_byte_count(default_vertex) * 6 * renderer.quads.count, null, GL_DYNAMIC_DRAW);
    
    glBindVertexArray(0);
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    
    renderer.camera_to_world = mat4_camera_to_world_look_at(type(vec3) [ 0; 2; 50 ], type(vec3) { 0; 2; 0 }, type(vec3) { 0; 1; 0 });
    renderer.world_to_camera = mat4_inverse_transform_unscaled(renderer.camera_to_world);
}

def frame_begin func(platform platform_api ref; renderer render_api ref; jiggle f32)
{
    renderer.window_size              = platform_window_frame(platform, renderer.window ref);
    renderer.window_width_over_height = renderer.window_size.x cast(f32) / renderer.window_size.y;
    renderer.jiggle = jiggle;
    renderer.camera_to_clip = mat4_perspective_projection_fov(0.6, renderer.window_width_over_height);
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
        //var min = scale(box.min, renderer.viewport_scale);
        //var max = scale(box.max, renderer.viewport_scale);
        var min = box.min;
        var max = box.max;
        
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
    
    glDisable(GL_CULL_FACE);
    glDisable(GL_DEPTH_TEST);
    
    glUseProgram(renderer.default_shader);
    
    var jiggle = mat4_transform(quat_axis_angle(type(vec3) { 0; 1; 0 }, renderer.jiggle));
    var world_to_camera = mat4_inverse_transform_unscaled(jiggle * renderer.camera_to_world );
    
    var world_to_clip = renderer.camera_to_clip * world_to_camera;
    glUniformMatrix4fv(renderer.default_shader_object_to_clip_uniform, 1, GL_FALSE, world_to_clip[0].base cast(GLfloat ref));
    
    glBindVertexArray(renderer.vertex_array);
    glDrawArrays(GL_TRIANGLES, 0, vertex_count);
    
    glBindVertexArray(0);
    glUseProgram(0);
    
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