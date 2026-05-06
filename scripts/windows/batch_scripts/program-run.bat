@echo off
set "ROOT_BASENAME=<program_name>"
::
set "ROOT_EXTENSION=<program_extension>"

:: source apktool.bat
set "JOIN=-"
set "BASENAME=%ROOT_BASENAME%%JOIN%"
::
rem Find the highest version .jar available in the same directory as the script
setlocal EnableDelayedExpansion
pushd "%~dp0"
if exist "%ROOT_BASENAME%.%ROOT_EXTENSION%" (
    set BASENAME=%ROOT_BASENAME%
    goto skipversioned
)
set max=0
for /f "tokens=1* delims=-_.0" %%A in ('dir /b /a-d %BASENAME%*.%ROOT_EXTENSION%') do if %%~B gtr !max! set max=%%~nB
:skipversioned
popd
setlocal DisableDelayedExpansion

set "execPath=%~dp0%BASENAME%%max%.%ROOT_EXTENSION%"
echo "%execPath%"
if exist %execPath% (
    cmd.exe /c "%execPath%" %*
)
