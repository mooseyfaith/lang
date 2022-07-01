
#version 330

in vec2 vertex_position;
in vec4 vertex_color;

out vec4 fragment_color;

uniform mat4 object_to_clip_projection;

void main()
{
    fragment_color = vertex_color;
    
    vec4 position = vec4(vertex_position, 0, 1);
    gl_Position = object_to_clip_projection * position;
    
    //gl_Position = vec4(vertex_position, 0, 1);
}