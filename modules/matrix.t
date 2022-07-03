module math;

def mat4 type vec4[4];

def mat4_identity = type(mat4)
[
    type(vec4) { 1; 0; 0; 0 };
    type(vec4) { 0; 1; 0; 0 };
    type(vec4) { 0; 0; 1; 0 };
    type(vec4) { 0; 0; 0; 1 };
];

def multiply func(transform mat4; vector vec4) (result vec4)
{
    var result = transform[0] * vector[0];
    loop var column = 1; transform.count
    {
        result = result + (transform[column] * vector[column]);
    }
    
    return result;
}

def multiply func(second mat4; first mat4) (result mat4)
{
    var result mat4;
    loop var column; first.count
    {
        result[column] = second * first[column];
    }
    
    return result;
}

// order: scale, rotate and then translate
def mat4_transform func(rotation = quat_identity; translation vec3 = {}; scale vec3 = [ 1; 1; 1 ]) (transform mat4)
{
    var result mat4;
    var xx = rotation.x * rotation.x;
    var xy = rotation.x * rotation.y;
    var xz = rotation.x * rotation.z;
    
    var yy = rotation.y * rotation.y;
    var yz = rotation.y * rotation.z;
    
    var zz = rotation.z * rotation.z;
    
    var wx = rotation.w * rotation.x;
    var wy = rotation.w * rotation.y;
    var wz = rotation.w * rotation.z;
    
    result[0][0] = (1 - (2 * (yy + zz))) 	* scale[0];
    result[1][0] =       2 * (xy - wz) 		  * scale[1];
    result[2][0] =       2 * (xz + wy)	 	  * scale[2];
    
    result[0][1] =       2 * (xy + wz)			   * scale[0];
    result[1][1] = (1 - (2 * (xx + zz)))	 * scale[1];
    result[2][1] =       2 * (yz - wx)			   * scale[2];
    
    result[0][2] =       2 * (xz - wy)			   * scale[0];
    result[1][2] =       2 * (yz + wx)			   * scale[1];
    result[2][2] = (1 - (2 * (xx + yy))	) * scale[2];
    
    result[3] = vec4_expand(translation, 1);
    
    return result;
}

// order: scale, rotate and then translate
def mat4_transform func(rotation_axis vec3; rotation_angle radians32; translation vec3 = {}; scale vec3 = [ 1; 1; 1 ]) (transform mat4)
{
    var rotation = quat_axis_angle(rotation_axis, rotation_angle);
    var result = mat4_transform(rotation, translation, scale);
    return result;
}

def mat4_camera_to_world_look_at func(center vec3; target vec3; relative_up vec3) (transform mat4)
{
    // camera forward points in opposite to the camera view direction
    var forward = normalize(center - target);
    var right   = normalize(cross(relative_up, forward));
    var up      = cross(forward, right);
    
    var result mat4 =
    [
        vec4_expand(right);
        vec4_expand(up);
        vec4_expand(forward);
        vec4_expand(center, 1);
    ];
    return result;
}

def mat4_camera_to_world_orbit func(target vec3; view_direction vec3; distance f32; relative_up vec3) (transform mat4)
{
    var forward     = normalize(-view_direction);
    var right       = normalize(cross(relative_up, forward));
    var up          = cross(forward, right);
    var translation = target + (forward * distance);
    
    var result mat4 =
    [
        vec4_expand(right);
        vec4_expand(up);
        vec4_expand(forward);
        vec4_expand(translation, 1);
    ];
    
    return result;
}

def mat4_inverse_transform func(transform mat4) (inverse mat4)
{
    var inverse_scale vec3;
    loop var i; 3
    {
        var column vec3 = [ transform[i][0]; transform[i][1]; transform[i][2]; ];
        inverse_scale[i] = 1.0 / length(column);
    }
        
    var result mat4;
    loop var x; 3
    {
        loop var y; 3
        {
            result[x][y] = transform[y][x] * inverse_scale[y];
        }
    }
    
    result[3][3] = 1;
    result[3] = result * vec4_expand(-vec3_cut(transform[3]), 1);
    return result;
}

def mat4_inverse_transform_unscaled func(transform mat4) (inverse mat4)
{
    var result mat4;
    loop var x; 3
    {
        loop var y; 3
        {
            result[x][y] = transform[y][x];
        }
    }
    
    result[3][3] = 1;
    result[3] = result * vec4_expand(-vec3_cut(transform[3]), 1);
    return result;
}

def mat4_perspective_projection func(a f32; b f32; c f32; d f32; e f32) (projection mat4)
{
    var result mat4;
    result[0][0] = a;
    result[1][1] = b;
    result[2][2] = c;
    result[3][2] = d;
    result[2][3] = e;
    
    return result;
}

def mat4_perspective_projection func(width f32; height f32; near_plane = 0.0001; far_plane = 1000.0) (projection mat4)
{
    var a = 2 * near_plane / width;
    var b = 2 * near_plane / height;
    var c = -    (far_plane + near_plane) / (far_plane - near_plane);
    var d = - 2 * far_plane * near_plane  / (far_plane - near_plane);
    var e = -1;
    
    return mat4_perspective_projection(a, b, c, d, e);
}

def mat4_perspective_projection_fov func(fov_y f32; width_over_height f32; near_plane = 0.0001; far_plane = 1000.0) (projection mat4)
{
    var height = 2 * near_plane * tan(fov_y * 0.5);
    var width = width_over_height * height;
    return mat4_perspective_projection(width, height, near_plane, far_plane);
}
