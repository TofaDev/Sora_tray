@echo off
set "SCRIPT_DIR=%~dp0"
set "EXE_PATH=%SCRIPT_DIR%dist\sora_tray.exe"

if not exist "%EXE_PATH%" (
    echo ERROR: sora_tray.exe not found in dist folder!
    pause
    exit /b 1
)

for %%I in ("%EXE_PATH%") do set "FULL_PATH=%%~fI"

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "SoraTray" /t REG_SZ /d "\"%FULL_PATH%\"" /f >nul 2>&1

if %errorlevel% == 0 (
    echo Successfully added to startup!
) else (
    echo ERROR: Failed to add to startup registry!
)

pause

