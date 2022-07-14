
import math;
import gl;
import platform;

def vertex_shader_source   = import_text_file("tetris/shaders/default.vert.glsl");
def fragment_shader_source = import_text_file("tetris/shaders/default.frag.glsl");

def default_vertex struct
{
    position vec3;
    normal   vec3;
    color    rgba32;
}

def camera_buffer struct
{
    world_to_clip_projection mat4 ;
    camera_world_position    vec4;
};

def max_transform_count = 256;

def transform_buffer struct
{
    object_to_world_transforms mat4[max_transform_count];
}

def max_light_count = 8;

def lighting_buffer struct
{
    parameters vec4[max_light_count];
    colors     vec4[max_light_count];
};

def rgba32 type u8[4];
def rgba32_white = type(rgba32) [ 255; 255; 255; 255 ];

def render_quad struct
{
    box   box2;
    color rgba32;
}

def render_light struct
{
    position vec3;
    color    vec3;
}

def uniform_buffer_binding enum s32
{
    camera;
    transform;
    lighting;
}

def mat_projection type mat4;
def mat_transform  type mat4;

def render_api struct
{
    window platform_window;
    
    quads render_quad[1024];
    quad_count u32;
    
    lights render_light[8];
    light_count u32;
    
    window_size              vec2s;
    window_width_over_height f32;
    
    gl gl_api;
    
    jiggle f32;
    camera_to_clip  mat_projection;
    camera_to_world mat_transform;
    world_to_camera mat_transform;
    
    default_shader u32;
    
    camera_buffer    gl_uniform_buffer;
    transform_buffer gl_uniform_buffer;
    lighting_buffer  gl_uniform_buffer;
    
    quad_buffer gl_vertex_buffer;
    brick_mesh gl_mesh;
}

def gl_mesh struct
{
    vertex_buffer gl_vertex_buffer;
    index_count   u32;
    index_buffer  u32;
}

def position_vertex struct
{
    position vec3;
}

def make_brick_mesh func() (result gl_mesh)
{
    def vertices = type(vec3[])
    [
        [ -1; -1;  1 ];
        [  1; -1;  1 ];
        [ -1;  1;  1 ];
        [  1;  1;  1 ];
        [ -1; -1; -1 ];
        [  1; -1; -1 ];
        [ -1;  1; -1 ];
        [  1;  1; -1 ];
    ];
    
    def indices = type(u32[]) 
    [
        0; 1; 3;
        0; 3; 2;
        
        1; 5; 7;
        1; 7; 3;
        
        2; 3; 7;
        2; 7; 6;
        
        5; 4; 6;
        5; 6; 7;
        
        4; 0; 2;
        4; 2; 6;
        
        1; 0; 4;
        1; 4; 5;
    ];
    
    var result gl_mesh;
    result.vertex_buffer = gl_create_vertex_buffer(get_type_info(position_vertex), vertices.count, vertices[0] ref cast(u8 ref));
    
    glGenBuffers(1, result.index_buffer ref);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, result.index_buffer);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, indices.count * 4, indices.base, GL_STATIC_DRAW);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
    
    return result;
}

def gl_uniform_buffer struct
{
    type lang_type_info;
    handle u32;
}

def gl_create_uniform_buffer func(type lang_type_info; value u8 ref = null) (result gl_uniform_buffer)
{
    var result gl_uniform_buffer;
    result.type = type;
    
    glGenBuffers(1, result.handle ref);
    glBindBuffer(GL_UNIFORM_BUFFER, result.handle);
    
    def is_dynamic = type(GLenum[])
    [
        GL_STATIC_DRAW;
        GL_DYNAMIC_DRAW
    ];
    
    glBufferData(GL_UNIFORM_BUFFER, type.byte_count, value, is_dynamic[value is_not null]);
    glBindBuffer(GL_UNIFORM_BUFFER, 0);
    
    return result;
}

def gl_vertex_buffer struct
{
    type lang_type_info;
    vertex_count  u32;
    vertex_array  u32;
    vertex_buffer u32;
}

def gl_create_vertex_buffer func(type lang_type_info; vertex_count usize; vertices u8 ref = null) (result gl_vertex_buffer)
{
    assert((type.base_type .) is lang_type_info_type.compound);
    
    var result gl_vertex_buffer;
    result.type         = type;
    result.vertex_count = vertex_count cast(u32);
    
    
    glGenVertexArrays(1, result.vertex_array ref);
    glGenBuffers(1,      result.vertex_buffer ref);
    
    glBindVertexArray(result.vertex_array);
    glBindBuffer(GL_ARRAY_BUFFER, result.vertex_buffer);
    
    def type_map = type(GLenum[])
    [
        GL_UNSIGNED_BYTE;
        GL_UNSIGNED_SHORT;
        GL_UNSIGNED_INT;
        GL_INVALID_ENUM; // there is no 64bit number type in gl
        
        GL_BYTE;
        GL_SHORT;
        GL_INT;
        GL_INVALID_ENUM; // there is no 64bit number type in gl
        
        GL_FLOAT;
        GL_DOUBLE;
    ];
    
    var compound = type.base_type cast(lang_type_info_compound ref);
    loop var i; compound.fields.count
    {
        var field = compound.fields[i];
        
        var gl_type GLenum;
        var item_count usize = 1;
        var do_normalize = false;
        
        var number_type lang_type_info_number_type;
        
        switch field.type.base_type . ;
        case lang_type_info_type.number
        {
            var number = field.type.base_type cast(lang_type_info_number ref);
            number_type = number.number_type;
        }
        case lang_type_info_type.array
        {
            var array = field.type.base_type cast(lang_type_info_array ref);
            item_count = array.item_count;
            
            assert((array.item_type.base_type.) is lang_type_info_type.number);
            number_type = array.item_type.base_type cast(lang_type_info_number ref).number_type;
        }
        else
        {
            assert(0);
        }
        
        gl_type = type_map[number_type];
        do_normalize = number_type < lang_type_info_number_type.f32;
    
        glVertexAttribPointer(i, item_count, gl_type, do_normalize, compound.byte_count, field.byte_offset cast(usize) cast(u8 ref));
        glEnableVertexAttribArray(i);
    }
    
    def is_dynamic = type(GLenum[])
    [
        GL_STATIC_DRAW;
        GL_DYNAMIC_DRAW
    ];
    
    glBufferData(GL_ARRAY_BUFFER, type.byte_count * vertex_count, vertices, is_dynamic[vertices is_not null]);
    
    glBindVertexArray(0);
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    
    return result;
}

def init func(renderer render_api ref; platform platform_api ref)
{
    gl_init(renderer.gl ref, platform);
    
    platform_window_init(platform, renderer.window ref, "tetris\0", 1280, 720);
    gl_window_init(platform, renderer.gl ref, renderer.window ref);
    
    var vertex_shader = create_shader_object(renderer.gl ref, false, vertex_shader_source, "vertex_shader");
    require(vertex_shader);
    
    var fragment_shader = create_shader_object(renderer.gl ref, true, fragment_shader_source, "fragment_shader");
    require(fragment_shader);
        
    renderer.default_shader = create_program_begin(renderer.gl ref);
    
    create_program_add_shader(renderer.gl ref, renderer.default_shader, vertex_shader);
    create_program_add_shader(renderer.gl ref, renderer.default_shader, fragment_shader);
    
    create_program_bind_attribute(renderer.gl ref, renderer.default_shader, 0, "vertex_position");
    create_program_bind_attribute(renderer.gl ref, renderer.default_shader, 1, "vertex_normal");
    create_program_bind_attribute(renderer.gl ref, renderer.default_shader, 2, "vertex_color");
    
    create_program_end(renderer.gl ref, renderer.default_shader);
    
    renderer.camera_buffer    = gl_create_uniform_buffer(get_type_info(camera_buffer));
    renderer.transform_buffer = gl_create_uniform_buffer(get_type_info(transform_buffer));
    renderer.lighting_buffer  = gl_create_uniform_buffer(get_type_info(lighting_buffer));
    
    var index = glGetUniformBlockIndex(renderer.default_shader, as_cstring("camera_buffer\0") cast(GLchar ref));
    glUniformBlockBinding(renderer.default_shader, index, uniform_buffer_binding.camera);
    
    index = glGetUniformBlockIndex(renderer.default_shader, as_cstring("transform_buffer\0") cast(GLchar ref));
    glUniformBlockBinding(renderer.default_shader, index, uniform_buffer_binding.transform);
    
    index = glGetUniformBlockIndex(renderer.default_shader, as_cstring("lighting_buffer\0") cast(GLchar ref));
    glUniformBlockBinding(renderer.default_shader, index, uniform_buffer_binding.lighting);
    
    renderer.brick_mesh = make_brick_mesh();
    
    renderer.quad_buffer = gl_create_vertex_buffer(get_type_info(default_vertex), 6 * renderer.quads.count);
    
    renderer.camera_to_world = mat4_camera_to_world_look_at(type(vec3) [ 4.5; 12; 50 ], type(vec3) [ 4.5; 12; 0 ], type(vec3) [ 0; 1; 0 ]);
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
        
        var normal vec3 = [ 0; 0; 1 ];
        
        quad_vertices[0].color = quad.color;
        quad_vertices[0].normal = normal;
        quad_vertices[0].position[0] = min[0];
        quad_vertices[0].position[1] = min[1];
        
        quad_vertices[1].color = quad.color;
        quad_vertices[1].normal = normal;
        quad_vertices[1].position[0] = max[0];
        quad_vertices[1].position[1] = min[1];
        
        quad_vertices[2].color = quad.color;
        quad_vertices[2].normal = normal;
        quad_vertices[2].position[0] = max[0];
        quad_vertices[2].position[1] = max[1];
        
        // 2nd triangle
        
        quad_vertices[3] = quad_vertices[0];
        quad_vertices[4] = quad_vertices[2];
        
        quad_vertices[5].color = quad.color;
        quad_vertices[5].normal = normal;
        quad_vertices[5].position[0] = min[0];
        quad_vertices[5].position[1] = max[1];
    }
    
    // upload
    
    glBindBuffer(GL_ARRAY_BUFFER, renderer.quad_buffer.vertex_buffer);
    glBufferSubData(GL_ARRAY_BUFFER, 0, type_byte_count(default_vertex) * vertex_count, vertices.base);
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    
    var jiggle = mat4_transform(quat_axis_angle(type(vec3) { 0; 1; 0 }, renderer.jiggle));
    var world_to_camera = mat4_inverse_transform_unscaled(jiggle * renderer.camera_to_world );
    
    var camera camera_buffer;
    camera.camera_world_position    = renderer.camera_to_world[3];
    camera.world_to_clip_projection = renderer.camera_to_clip * world_to_camera;
    glBindBuffer(GL_UNIFORM_BUFFER, renderer.camera_buffer.handle);
    glBufferSubData(GL_UNIFORM_BUFFER, 0, renderer.camera_buffer.type.byte_count, camera ref); 
    glBindBuffer(GL_UNIFORM_BUFFER, 0);
    
    var transforms transform_buffer;
    transforms.object_to_world_transforms[0] = mat4_identity;
    glBindBuffer(GL_UNIFORM_BUFFER, renderer.transform_buffer.handle);
    glBufferSubData(GL_UNIFORM_BUFFER, 0, renderer.transform_buffer.type.byte_count, transforms ref); 
    glBindBuffer(GL_UNIFORM_BUFFER, 0);
    
    var lighting lighting_buffer;
    loop var i; renderer.light_count
    {
        lighting.parameters[i] = vec4_expand(renderer.lights[i].position);
        lighting.colors[i]     = vec4_expand(renderer.lights[i].color);
    }
    glBindBuffer(GL_UNIFORM_BUFFER, renderer.lighting_buffer.handle);
    glBufferSubData(GL_UNIFORM_BUFFER, 0, renderer.lighting_buffer.type.byte_count, lighting ref); 
    glBindBuffer(GL_UNIFORM_BUFFER, 0);
    
    // render
    
    //glDisable(GL_CULL_FACE);
    glDisable(GL_DEPTH_TEST);
    
    glUseProgram(renderer.default_shader);
    
    glBindBufferBase(GL_UNIFORM_BUFFER, uniform_buffer_binding.camera,    renderer.camera_buffer.handle);
    glBindBufferBase(GL_UNIFORM_BUFFER, uniform_buffer_binding.transform, renderer.transform_buffer.handle);
    glBindBufferBase(GL_UNIFORM_BUFFER, uniform_buffer_binding.lighting,  renderer.lighting_buffer.handle);
    
    glBindVertexArray(renderer.quad_buffer.vertex_array);
    glDrawArrays(GL_TRIANGLES, 0, vertex_count);
    
    glBindVertexArray(0);
    glUseProgram(0);
    
    gl_window_present(platform, renderer.gl ref, renderer.window ref);
    
    renderer.quad_count  = 0;
    renderer.light_count = 0;
}

def push_quad func(renderer render_api ref; box box2; color rgba32; location code_location = get_call_location())
{
    assert(renderer.quad_count < renderer.quads.count, location);
    renderer.quads[renderer.quad_count].box   = box;
    renderer.quads[renderer.quad_count].color = color;
    renderer.quad_count = renderer.quad_count + 1;
}

def push_light func(renderer render_api ref; position vec3; color vec3; location code_location = get_call_location())
{
    assert(renderer.light_count < renderer.lights.count, location);
    renderer.lights[renderer.light_count].position = position;
    renderer.lights[renderer.light_count].color    = color;
    renderer.light_count = renderer.light_count + 1;
}