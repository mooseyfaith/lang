@echo off

set name=gl_to_lang

set source=%cd%\code\gl_to_lang.cpp
set options=/MTd /Od /DEBUG /Zi /EHsc /nologo /I %cd%/code

if not exist build mkdir build
pushd build

cl /Fe%name% %source% %options% /link /INCREMENTAL:NO

popd

copy build\*.pdb *.pdb >NUL 2>NUL
copy build\*.dll *.dll >NUL 2>NUL
copy build\*.exe *.exe >NUL 2>NUL
