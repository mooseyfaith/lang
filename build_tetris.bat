
@echo off

set name=tetris

set source=%cd%\lang_output.cpp
set options=/MTd /Od /DEBUG /Zi /EHsc /nologo /I %cd%/code
rem set options=/MT /O2 /EHsc /nologo /I %cd%/code

lang tests\tetris.t modules\platform.t modules\platform_win32.t modules\gl.t modules\gl_win32.t

if not exist build mkdir build
pushd build

cl /Fe%name% %source% %options% /link /INCREMENTAL:NO

popd

copy build\*.pdb *.pdb >NUL 2>NUL
copy build\*.dll *.dll >NUL 2>NUL
copy build\*.exe *.exe >NUL 2>NUL

