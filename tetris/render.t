
import gl;
import gl_win32;
import platform;

def render_api struct
{
    window platform_window;
    
    gl gl_api;
    
    default_shader u32;
}

def init func(renderer render_api ref; platform platform_api ref)
{
    gl_init(renderer.gl ref, platform, true);
    
    platform_window_init(platform, renderer.window ref, "tetris\0", 1280, 720);
    gl_window_init(platform, renderer.gl ref, renderer.window ref);
}

def present func(platform platform_api ref; renderer render_api ref)
{
    gl_window_present(platform, renderer.gl ref, renderer.window ref);
}