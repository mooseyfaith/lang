# lang
a simple c like language experiment

# features
- orderindependent declarations
- modules instead of #include
- different syntax (experimental)
- function and operator overloading (partial)
- declare bindings to .dll and .lib
- arrays with size and pointer, instead of just pointers

#example hello triangle

```

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

while true
{
    if not platform_handle_messages(platform ref)
    {
        break;
    }
    
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
    
    SwapBuffers(window.device_context);
}
```

# state

Work in Progress.<br/>
The language has a very selective feature set implementation to make tests\tetris.t work.<br/>
Even simple math expressions and most operators are NOT supported.<br/>

Checkout tetris branch for the latest stable version to build tetris.t.
Checkout main branch for latest version, which might be unstable or work in progress.

gl_to_lang is a sub project to generate gl bindings for this language from gl header files.

# build
You only need Visual Studio C++ and Windows SDK for this project, no other dependencies.
1. run build.bat (in visual studio command prompt)

# use
1. compile to C:   lang.exe <list of files and/or directories>
2. compile to EXE: cl lang_output.cpp (in visual studio command prompt)
3. run lang_output.exe

example: lang.exe modules\platform. tests\test.t & cl lang_output.cpp & lang_output.exe

# gl_to_lang: gl bindings generation
Semi automatic generation for opengl function bindinds from gl.h, glext.h, wglext.h.<br/>
This will generate a file tests\gl_win32.t containing functions and function signatures and link information to opengl.dll.

NOTE: You can also use code/gl_win32.h for your C/C++ projects with all the latest generated bindings after full compilation with lang.exe and some manual editions.

If you want to build it yourself:
1. in gl_to_lang.cpp set proper file path for <gl/gl.h> (in windows sdk), gl_ext.h and wglext.h (download from https://github.com/KhronosGroup/OpenGL-Registry/tree/main/api/GL)
2. run build_gl_to_lang.bat (in visual studio command prompt)
3. run gl_to_lang.exe

Build programs with gl bindings.<br/>

These require these files: modules\platform.t modules\gl_win32.t modules\gl.t

Example: tests\tetris.t
NOTE: While on a WIP commit, this might not compile.

1. compile test program: "lang.exe tests\tetris.t modules"
3. compile to EXE:       cl lang_output.cpp (in visual studio command prompt)
4. run lang_output.exe

or

1. run build_tetris.bat (in visual studio command prompt)
2. run tetris.exe
