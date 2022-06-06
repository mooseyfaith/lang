# lang
a simple c like language experiment

# features
- orderindependent declarations
- modules instead of #include
- different syntax (experimental)

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
3. run langoutput.exe

example: lang.exe modules\platform. tests\test.t & cl langoutput.cpp & lang_output.exe

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
