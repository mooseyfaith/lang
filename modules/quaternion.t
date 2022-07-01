
module math;

// w, x, y, z
def quat type f32[4];

def quat_identity = type(quat) [ 1; 0; 0; 0 ];

def quat_axis_cos_sin func(normalized_rotation_axis vec3; cos_value f32; sin_value f32) (result quat)
{
    //assert(are_close(length(normalized_rotation_axis), (f32)1));
        
    var result quat =
    [
        cos_value;
        normalized_rotation_axis[0] * sin_value;
        normalized_rotation_axis[1] * sin_value;
        normalized_rotation_axis[2] * sin_value;
    ];
    
    return result;
}

def quat_axis_angle func(normalized_rotation_axis vec3; angle radians32) (result quat)
{
    angle = angle * 0.5;
    var cos_value = cos(angle) cast(f32);
    var sin_value = sin(angle) cast(f32);
    
    return quat_axis_cos_sin(normalized_rotation_axis, cos_value, sin_value);
}

def quat_between_normals func(from_normal vec3; to_normal vec3) (result quat)
{
    var normalized_rotation_axis = cross(from_normal, to_normal);
    var cos_value = dot(from_normal, to_normal);
    var sin_value = sqrt(1 - (cos_value * cos_value));
    
    return quat_axis_cos_sin(normalized_rotation_axis, cos_value, sin_value);
}

def negate func(value quat) (result quat)
{
    var result quat = value;
    result[0] = -result[0];
    
    return result;
}

def mul func(second quat; first quat) (result quat)
{
    var result quat = 
    [
        first[0] * second[0] - first[1] * second[1] - first[2] * second[2] - first[3] * second[3];
        first[0] * second[1] + first[1] * second[0] + first[2] * second[3] - first[3] * second[2];
        first[0] * second[2] - first[1] * second[3] + first[2] * second[0] + first[3] * second[1];
        first[0] * second[3] + first[1] * second[2] - first[2] * second[1] + first[3] * second[0]
    ];
    
    return result;
}

def inverse func(value quat) (result quat)
{
    var inverse_length_squared = -1.0 / (value[0] * value[0] + value[1] * value[1] + value[2] * value[2] + value[3] * value[3]);
    
    var result quat =
    [
        value[0] * inverse_length_squared;
        value[1] * inverse_length_squared;
        value[2] * inverse_length_squared;
        value[3] * inverse_length_squared;
    ];
    
    return result;
}

// fast lerp, instead of accurate slerp
def lerp_and_normalize func(a quat; b quat; ratio f32) (result quat)
{
    // cast to vec4 so we can use vec4 operators
    var av = a ref cast(vec4 ref) . ;
    var bv = b ref cast(vec4 ref) . ;
    
    var resultv = normalize(lerp(av, bv, ratio));
    
    var result = resultv ref cast(quat ref) . ;
    return result;
}
