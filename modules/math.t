
module math;

def radians32 type f32;

def pi32 = 3.14159265358979323846;

def sqrt func(_X f64) (result f64) calling_convention "__cdecl" extern_binding("kernel32", false);
def sin  func(_X f64) (result f64) calling_convention "__cdecl" extern_binding("kernel32", false);
def cos  func(_X f64) (result f64) calling_convention "__cdecl" extern_binding("kernel32", false);
def tan  func(_X f64) (result f64) calling_convention "__cdecl" extern_binding("kernel32", false);
def fmod func(a f64; b f64) (result f64) calling_convention "__cdecl" extern_binding("kernel32", false);

def sqrt func(_X f32) (result f32)
{
    return sqrt(_X cast(f64)) cast(f32);
}

def sin func(_X f32) (result f32)
{
    return sin(_X cast(f64)) cast(f32);
}

def cos func(_X f32) (result f32)
{
    return cos(_X cast(f64)) cast(f32);
}

def tan func(_X f32) (result f32)
{
    return tan(_X cast(f64)) cast(f32);
}

def fmod func(a f32; b f32) (result f32)
{
    return fmod(a cast(f64), b cast(f64)) cast(f32);
}
