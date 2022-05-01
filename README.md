# lang
a simple c like language experiment

# state
Work in Progress (1 week of development).<br/>
The language has a very selective feauture implementaion to make tests\tetris.t work.<br/>
Even simple math expressions and most operators are NOT supported.<br/>


go_to_lang is a sub project to generate gl bindings for this language from gl header files.

# build
You only need Visual Studio C++ and Windows SDK for this project, no other dependencies.
1. build.bat (in visual studio command prompt)

# use
1. compile to C:   lang.exe <list of files and/or directories>
2. compile to EXE: cl lang_output.cpp (in visual studio command prompt)
3. run langoutput.exe

example: lang.exe tests\platform. tests\test.t & cl langoutput.cpp & lang_output.exe

# gl_to_lang: gl bindings generation
Semi automatic gemeratopm for opengl function bindinds from gl.h, glext.h, wglext.h.<br/>
This will generate a file tests\gl_win32.t containing functions and function signatures and link information to opengl.dll.

1. in gl_to_lang.cpp set proper file path for <gl/gl.h> (in windows sdk)
2. build_gl_to_lang.bat (in visual studio command prompt)
3. run gl_to_lang.exe

Build programs with gl bindings.<br/>
These require the files: tests\platform.t tests\gl_win32.t tests\gl.t
Example: tests\tetris.t (Hello Triangle)
1. compile test program: lang.exe tests\platform.t tests\gl_win32.t tests\gl.t tests\tetris.t
2. compile to EXE:       cl lang_output.cpp (in visual studio command prompt)
3. run lang_output.exe
