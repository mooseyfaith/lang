@echo off

set source=%cd%\code\main.cpp
set options=/MTd /Od /DEBUG /Zi /EHsc /nologo /I %cd%/code

if not exist build mkdir build
pushd build

cl %source% %options% /link /INCREMENTAL:NO

popd

copy build\*.pdb *.pdb >NUL 2>NUL
copy build\*.dll *.dll >NUL 2>NUL
copy build\*.exe *.exe >NUL 2>NUL
