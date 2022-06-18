
// build and run (in vs terminal): lang.exe tests\triangle.t modules & build_lang_output.bat & lang_output.exe

import platform;
import gl;

var platform platform_api;
platform_init(platform ref);

var gl gl_api;
var backwards_compatible = true;
gl_init(gl ref, platform ref, backwards_compatible);

var window platform_window;
platform_window_init(platform ref, window ref, "window\0", 1280, 720);
gl_window_init(platform ref, gl ref, window ref);

platform_update_time(platform ref); // skip startup time

while platform_handle_messages(platform ref)
{
    // update
    // ...
    
    // render
    
    var window_size vec2s = platform_window_frame(platform ref, window ref);
    var window_width_over_height f32 = window_size.x cast(f32) / window_size.y cast(f32);
    
    glViewport(0, 0, window_size.x, window_size.y);
    glClearColor(0, 0, 0, 1);
    glClear(GL_COLOR_BUFFER_BIT);
    
    glBegin(GL_TRIANGLES);
    
    glColor4f(1, 0, 0, 1);
    glVertex2f(-0.5, -0.5 * window_width_over_height);
    
    glColor4f(0, 1, 0, 1);
    glVertex2f(0.5, -0.5 * window_width_over_height);
    
    glColor4f(0, 0, 1, 1);
    glVertex2f(0.0, 0.5 * window_width_over_height);
    
    glEnd();
    
    gl_window_present(platform ref, gl ref, window ref);
}