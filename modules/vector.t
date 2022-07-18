
module math;

def vec2 type f32[2];
def vec3 type f32[3];
def vec4 type f32[4];

def vec4_expand func(vector vec3; w = 0.0) (result vec4)
{
    var result vec4 = [ vector[0]; vector[1]; vector[2]; w ];
    return result;
}

def vec3_cut func(vector vec4) (result vec3)
{
    var result vec3 = [ vector[0]; vector[1]; vector[2] ];
    return result;
}

def add func(a vec2; b f32) (result vec2)
{
    var result vec2;
    loop var i; a.count
    {
        result[i] = a[i] + b;
    }
    
    return result;
}

def add func(a vec2; b vec2) (result vec2)
{
    var result vec2;
    loop var i; a.count
    {
        result[i] = a[i] + b[i];
    }
    
    return result;
}

def negate func(a vec2) (result vec2)
{
    var result vec2;
    loop var i; a.count
    {
        result[i] = -a[i];
    }
    
    return result;
}

def subtract func(a vec2; b vec2) (result vec2)
{
    var result vec2;
    loop var i; a.count
    {
        result[i] = a[i] - b[i];
    }
    
    return result;
}

def subtract func(vector vec2; scalar f32) (result vec2)
{
    var result vec2;
    loop var i; vector.count
    {
        result[i] = vector[i] - scalar;
    }
    
    return result;
}

def multiply func(vector vec2; scalar f32) (result vec2)
{
    var result vec2;
    loop var i; vector.count
    {
        result[i] = vector[i] * scalar;
    }
    
    return result;
}

def scale func(a vec2; b vec2) (result vec2)
{
    var result vec2;
    loop var i; a.count
    {
        result[i] = a[i] * b[i];
    }
    
    return result;
}

def dot func(a vec2; b vec2) (result f32)
{
    var result = a[0] * b[0];
    loop var i = 1; a.count
    {
        result = (a[i] * b[i]) + result;
    }
    
    return result;
}

def squared_length func(vector vec2) (result f32)
{
    var result = dot(vector, vector);
    return result;
}

def length func(vector vec2) (result f32)
{
    var result = sqrt(squared_length(vector));
    return result;
}

// vec3

def add func(a vec3; b f32) (result vec3)
{
    var result vec3;
    loop var i; a.count
    {
        result[i] = a[i] + b;
    }
    
    return result;
}

def add func(a vec3; b vec3) (result vec3)
{
    var result vec3;
    loop var i; a.count
    {
        result[i] = a[i] + b[i];
    }
    
    return result;
}

def negate func(a vec3) (result vec3)
{
    var result vec3;
    loop var i; a.count
    {
        result[i] = -a[i];
    }
    
    return result;
}

def subtract func(a vec3; b vec3) (result vec3)
{
    var result vec3;
    loop var i; a.count
    {
        result[i] = a[i] - b[i];
    }
    
    return result;
}

def subtract func(vector vec3; scalar f32) (result vec3)
{
    var result vec3;
    loop var i; vector.count
    {
        result[i] = vector[i] - scalar;
    }
    
    return result;
}

def multiply func(vector vec3; scalar f32) (result vec3)
{
    var result vec3;
    loop var i; vector.count
    {
        result[i] = vector[i] * scalar;
    }
    
    return result;
}

def scale func(a vec3; b vec3) (result vec3)
{
    var result vec3;
    loop var i; a.count
    {
        result[i] = a[i] * b[i];
    }
    
    return result;
}

def dot func(a vec3; b vec3) (result f32)
{
    var result = a[0] * b[0];
    loop var i = 1; a.count
    {
        result = (a[i] * b[i]) + result;
    }
    
    return result;
}


// using right hand rule
def cross func(right_thumb vec3; right_index vec3) (right_middle vec3)
{
    var right_middle vec3 = 
    [
        (right_thumb[1] * right_index[2]) - (right_thumb[2] * right_index[1]);
        (right_thumb[2] * right_index[0]) - (right_thumb[0] * right_index[2]);
        (right_thumb[0] * right_index[1]) - (right_thumb[1] * right_index[0]);
    ];
    
    return right_middle;
}

def length func(vector vec3) (result f32)
{
    var result = sqrt(dot(vector, vector));
    return result;
}

def normalize func(vector vec3) (result vec3)
{
    var inverse_length = 1.0 / length(vector);
    vector[0] = vector[0] * inverse_length;
    vector[1] = vector[1] * inverse_length;
    vector[2] = vector[2] * inverse_length;
    
    return vector;
}

// vec4

def negate func(a vec4) (result vec4)
{
    var result vec4;
    loop var i; a.count
    {
        result[i] = -a[i];
    }
    
    return result;
}

def add func(a vec4; b vec4) (result vec4)
{
    var result vec4;
    loop var i; a.count
    {
        result[i] = a[i] + b[i];
    }
    
    return result;
}

def multiply func(vector vec4; scalar f32) (result vec4)
{
    var result vec4;
    loop var i; vector.count
    {
        result[i] = vector[i] * scalar;
    }
    
    return result;
}

def dot func(a vec4; b vec4) (result f32)
{
    var result = a[0] * b[0];
    loop var i = 1; a.count
    {
        result = (a[i] * b[i]) + result;
    }
    
    return result;
}

def length func(vector vec4) (result f32)
{
    var result = sqrt(dot(vector, vector));
    return result;
}

def normalize func(vector vec4) (result vec4)
{
    var inverse_length = 1.0 / length(vector);
    vector[0] = vector[0] * inverse_length;
    vector[1] = vector[1] * inverse_length;
    vector[2] = vector[2] * inverse_length;
    vector[3] = vector[3] * inverse_length;
    
    return vector;
}

def lerp func(from vec4; to vec4; ratio f32) (result vec4)
{
    var one_minus_ratio = 1 - ratio;
    var result vec4 = 
    [
        (from[0] * one_minus_ratio) + (to[0] * ratio);
        (from[1] * one_minus_ratio) + (to[1] * ratio);
        (from[2] * one_minus_ratio) + (to[2] * ratio);
        (from[3] * one_minus_ratio) + (to[3] * ratio);
    ];
    
    return result;
}

// using right hand rule
def cross func(right_thumb vec4; right_index vec4) (right_middle vec4)
{
    var right_middle vec4 = 
    [
        (right_thumb[1] * right_index[2]) - (right_thumb[2] * right_index[1]);
        (right_thumb[2] * right_index[3]) - (right_thumb[3] * right_index[2]);
        (right_thumb[3] * right_index[0]) - (right_thumb[0] * right_index[3]);
        (right_thumb[0] * right_index[1]) - (right_thumb[1] * right_index[0]);
    ];
    
    return right_middle;
}
