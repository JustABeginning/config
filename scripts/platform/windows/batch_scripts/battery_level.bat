:: Start
@echo off
set "tab=    "
:: Create TEMP File
set "tmp_val=tmp_val.txt"
WMIC PATH Win32_Battery Get EstimatedChargeRemaining | find /I /V "estimated" > %tmp_val%
set /p level=< %tmp_val%
set /A level=%level%
WMIC Path Win32_Battery Get BatteryStatus | find /I /V "battery" > %tmp_val%
set /p status=< %tmp_val%
set /A status=%status%
powershell -Command "Get-Ciminstance -Namespace root/WMI -ClassName WmiMonitorBrightness" | find "CurrentBrightness" > %tmp_val%
set /p brightness=< %tmp_val%
:: Delete TEMP File
:del_tmpVal
if exist %tmp_val% (
    del %tmp_val% & goto :del_tmpVal
)
set "setBI=battery_info.txt"
echo %tab%Battery Level = %level% %%> %setBI%
echo.>> %setBI%
if %status%==2 (
    echo %tab%Battery Mode: CHARGING>> %setBI%
) else (
    echo %tab%Battery Mode: DISCHARGING>> %setBI%
)
echo.>> %setBI%
echo %tab%%brightness% %%>> %setBI%
echo.
type %setBI%
:del_BI
if exist %setBI% (
    del %setBI% & goto :del_BI
)
echo.
pause
exit /b %errorlevel%
:: End of Main Function
