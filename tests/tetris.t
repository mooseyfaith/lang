import platform;
import gl;

var window platform_api_window;
platform_window(platform ref, window ref, "tetris");

var gl gl_api;
gl_init(gl ref, platform ref);

gl_win32_window_init_1(window.device_context);
platform_require(wglMakeCurrent(window.device_context, gl.win32_context));

while true
{
    if not platform_handle_messages(platform ref) 
    {
        break;
    }
    
    var window_size vec2s = platform_window_frame(platform ref, window ref);
    
    glViewport(0, 0, window_size.x, window_size.y);
    glClearColor(0, 0, 0, 1);
    glClear(GL_COLOR_BUFFER_BIT);
    
    glBegin(GL_TRIANGLES);
    
    glColor3f(1, 0, 0);
    glVertex2f(0, 0);
    
    glColor3f(0, 1, 0);
    glVertex2f(1, 0);
    
    glColor3f(0, 0, 1);
    glVertex2f(0, 1);
    
    glEnd();
    
    SwapBuffers(window.device_context);
}
