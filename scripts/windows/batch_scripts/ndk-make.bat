@echo off
set "NDK_MAKE=%NDK_HOME%\prebuilt\windows-x86_64\bin\make.exe"
if exist %NDK_MAKE% (
    cmd /c %NDK_MAKE% %*
) else (
    echo "%NDK_MAKE% DOESN'T EXIST !"
)
