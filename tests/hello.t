
// build and run (in vs terminal): lang.exe tests\hello.t modules & build_lang_output.bat & lang_output.exe

import platform;

// very ugly, but print is going to be properly replace, to not use 0-terminated strings
printf("hello world\n\0".base cast(cstring));