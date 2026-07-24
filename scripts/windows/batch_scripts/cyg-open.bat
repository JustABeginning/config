@echo off
set "tempqd=C:\cygwin64"
if exist %tempqd% (goto :next) else (goto :end)
:next
set "setup=%tempqd%\setup-x86_64.exe"
if exist %setup% (
	start %setup%
)
:end
