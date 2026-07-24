:: Start Main
@echo off
set /A count=0
for %%a in (%*) do (
    set /A count+=1
)
if not %count% EQU 2 (
    goto :end
)
where sed.exe >nul 2>nul
if %errorlevel% EQU 0 (
    goto :continue_sed
) else (
    goto :end
)
:continue_sed
where adb.exe >nul 2>nul
if %errorlevel% EQU 0 (
    goto :continue_adb
) else (
    goto :end
)
:continue_adb
for /f "tokens=*" %%a in ('adb shell pm path "%1"') do (
    call :pull_apk "%%a" "%2"
)
:end
exit /b %errorlevel%
:: End Main
:pull_apk
for /f "tokens=*" %%a in ('echo "%~1" ^| sed "s/package://g"') do (
    adb pull %%a "%~2"
)
exit /b 0
