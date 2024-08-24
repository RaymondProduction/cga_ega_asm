@echo off
if "%1"=="" goto usage

tasm %1.asm
if errorlevel 1 goto error

tlink %1.obj
if errorlevel 1 goto error

%1.exe
goto end

:usage
echo Usage: %0 filename_without_extension
goto end

:error
echo An error occurred during compilation or linking.

:end