@echo off
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "SoraTray" /f >nul 2>&1

if %errorlevel% == 0 (
    echo Successfully removed from startup!
) else (
    echo INFO: Sora Tray was not in startup list.
)

pause

