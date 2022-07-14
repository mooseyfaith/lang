
#version 330

in vec3 vertex_position;
in vec3 vertex_normal;
in vec4 vertex_color;

out fragment_type
{
    vec3 world_position;
    vec3 world_normal;
    vec4 color;
} fragment;

#define max_transform_count 256

layout (std140) uniform camera_buffer
{
    mat4 world_to_clip_projection;
    vec4 camera_world_position;
};

layout (std140) uniform transform_buffer
{
    mat4 object_to_world_transforms[max_transform_count];
};

void main()
{
    vec4 position = vec4(vertex_position, 1);
    vec4 world_position = object_to_world_transforms[0] * position;
    
    vec4 normal = vec4(vertex_normal, 0);
    vec4 world_normal = object_to_world_transforms[0] * normal;
    
    fragment.world_position = world_position.xyz / world_position.w;
    fragment.world_normal   = world_normal.xyz;
    fragment.color          = vertex_color;
    
    gl_Position = world_to_clip_projection * world_position;
    
    //gl_Position = vec4(vertex_position, 0, 1);
}