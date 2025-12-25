# Sora Tray Charge Notification

## Introduction
![Screenshot](images/screenshot.png)<br>
This is a script for **Windows** written in Python 3.10+ with `wxPython` and `hidapi` that gets the battery level of a **Ninjutso Sora V2** Wireless mouse and shows it in system tray.

## What's New in This Fork

This fork adds several improvements and features:

- **🔨 Executable Build Support**: Added PyInstaller configuration (`sora_tray.spec`) and build scripts (`build.bat`, `build.ps1`) to create standalone Windows executable
- **🚀 Auto-startup Scripts**: Added scripts to easily add/remove the program from Windows startup (`add_to_startup.bat/ps1`, `remove_from_startup.bat/ps1`)
- **📦 Improved Packaging**: Enhanced resource handling for exe builds, including proper font detection and icon support
- **🔧 Better hidapi Integration**: Added custom PyInstaller hooks for reliable `hidapi` module inclusion in exe builds
- **✨ Code Cleanup**: Removed unnecessary comments and streamlined code structure
- **📝 Updated Documentation**: Improved README with build instructions and startup configuration

**Key Benefits:**
- No Python installation required - just run the exe file
- Easy distribution - single executable file with all dependencies
- Simple startup configuration - one-click scripts for autostart

## Instruction

### Running from source:
1. Clone this repository.
2. Install dependencies: `pip install -r requirements.txt`.
3. Run the script: `python sora_tray.py`
4. Change extension of script file from `sora_tray.py` to `sora_tray.pyw` if you don't want to see console output.

### Building executable (exe):
1. Install dependencies: `pip install -r requirements.txt`
2. Run `build.bat` (or `build.ps1` for PowerShell)
3. The executable will be created in the `dist` folder as `sora_tray.exe`
4. You can run `sora_tray.exe` directly - no Python installation needed!

**Note**: The exe file includes all dependencies and can be distributed standalone.

### Adding to Windows Startup:

To make Sora Tray start automatically when Windows boots:

**Option 1: Using batch script**
- Double-click `add_to_startup.bat` (or run it from command prompt)

**Option 2: Using PowerShell script**
- Right-click `add_to_startup.ps1` → "Run with PowerShell"
- Or run: `powershell -ExecutionPolicy Bypass -File add_to_startup.ps1`

**Option 3: Manual**
- Press `Win+R`, type `shell:startup`, press Enter
- Create a shortcut to `dist\sora_tray.exe` in that folder

To remove from startup, use `remove_from_startup.bat` or `remove_from_startup.ps1`.

## Settings
You can modify these settings variables:
1. `poll_rate` in seconds - how often battery charge is read. 60 sec by default.
2. `foreground_color` - color of indicator text. Tuple with RGB data.
3. `backgroung_color` - color of indicator background. Transparent by default (0, 0, 0, 0).
4. `font` - indicator font.