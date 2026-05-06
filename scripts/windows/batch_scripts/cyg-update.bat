@echo off
set "tempqd=C:\cygwin64"
if exist %tempqd% (goto :next) else (goto :end)
:next
set "setup=%tempqd%\setup-x86_64.exe"
::if exist %setup% (
::	del %setup%
::)
echo.
set /p proxy="Use PROXY ? (y/n) : "
echo.
if "%proxy%" == "n" (
	wget https://cygwin.com/setup-x86_64.exe -P %tempqd% -O %setup% & goto :task
)
set /p addr="Enter PROXY ADDRESS : "
echo.
set /p port="Enter PORT : "
echo.
wget https://cygwin.com/setup-x86_64.exe -P %tempqd% -O %setup% -e use_proxy=yes -e https_proxy=%addr%:%port%
:task
start %setup%
:end
