:: Start Main
@echo off
set /A count=0
for %%a in (%*) do (
    set /A count+=1
)
if not %count% EQU 3 (
    goto :end
)
where gpg.exe >nul 2>nul
if %errorlevel% EQU 0 (
    goto :continue_gpg
) else (
    goto :end
)
:continue_gpg
if exist %1 (
    goto :continue
) else (
    goto :end
)
:continue
rem Create TEMP File
set "tmp_val=%USERPROFILE%\.ssh\tmp_val.txt"
gpg -q --yes -o "%tmp_val%" -d %1
if exist "%tmp_val%" (
    goto :continue_ssh
) else (
    goto :end
)
:continue_ssh
scp -r -i "%tmp_val%" %2 %3
rem Delete TEMP File
if exist "%tmp_val%" (
    del "%tmp_val%"
)
:end
exit /b %errorlevel%
:: End Main
