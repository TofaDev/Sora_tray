@echo off
cd /d "%~dp0"

echo Building Sora Tray executable...
echo.

python -c "import PyInstaller" 2>nul
if errorlevel 1 (
    echo PyInstaller not found. Installing...
    python -m pip install pyinstaller
)

if exist build rmdir /s /q build
if exist dist rmdir /s /q dist

echo Building executable...
python -m PyInstaller sora_tray.spec --clean

if exist dist\sora_tray.exe (
    echo.
    echo Build successful!
    echo Executable: dist\sora_tray.exe
) else (
    echo.
    echo Build failed!
    pause
    exit /b 1
)

pause

