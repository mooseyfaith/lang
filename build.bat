@echo off

rem version 0 - 21.05.2022

set name=
if "%name%"=="" (
    rem find directory name and use it as exe name
    for %%I in (.) do set name=%%~nxI
)

set includes=/I %cd%/code /I %cd%/common

set source=%cd%\code\main.cpp
set options=/MTd /Od /DEBUG /Zi /EHsc /nologo %includes%
rem set options=/MT /O2 /EHsc /nologo %includes%

if not exist build mkdir build

del build\embedded_files.rc > NUL 2>NUL
echo lang_internal.t RCDATA "%cd:\=/%/code/lang_internal.t" >> build\embedded_files.rc

pushd build

rc /nologo /fo emedded_files.res /r embedded_files.rc

cl /Fe%name% %source% %options% emedded_files.res /link /INCREMENTAL:NO

popd

copy build\*.pdb *.pdb >NUL 2>NUL
copy build\*.dll *.dll >NUL 2>NUL
copy build\*.exe *.exe >NUL 2>NUL
