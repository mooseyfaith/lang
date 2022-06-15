
module math;

def vec2 type f32[2];
def vec3 type f32[3];
def vec4 type f32[4];

//def vec4 union
//{
//    f32[4];
//    struct { x   f32; y     f32; z    f32; w     f32; };
//    struct { r   f32; g     f32; b    f32; a     f32; };
//    struct { red f32; green f32; blue f32; alpha f32; };
//}

//def node struct
//{
//    type node_type;
//}

//def my_node union
//{
//    node;
//    
//    struct
//    {
//        base node;
//        //..
//    }
//}


def add func(a vec4; b vec4) (result vec4)
{
    var result vec4;
    loop var i; a.count
    {
        result[i] = a[i] + b[i];
    }
    
    return result;
}

def neg func(a vec4) (result vec4)
{
    var result vec4;
    loop var i; a.count
    {
        result[i] = -a[i];
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

//def mul func(transform mat4; vector vec4) (result vec4)
//{
//    var result vec4;
//    loop var column; mat4.count
//    {
//        result[column] = dot(mat4[column], vector);
//    }
//    
//    return result;
//}

//def mul func(second mat4; first mat4) (result mat4)
//{
//    var result mat4;
//    loop var column; first.count
//    {
//        result[column] = second * first[column];
//    }
//    
//    return result;
//}