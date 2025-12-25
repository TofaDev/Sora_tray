$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $ScriptDir

Write-Host "Building Sora Tray executable..." -ForegroundColor Green
Write-Host ""

if (-not (Test-Path "sora_tray.py")) {
    Write-Host "ERROR: sora_tray.py not found!" -ForegroundColor Red
    pause
    exit 1
}

try {
    python -c "import PyInstaller" 2>$null
    if ($LASTEXITCODE -ne 0) {
        throw "PyInstaller not found"
    }
} catch {
    Write-Host "PyInstaller not found. Installing..." -ForegroundColor Yellow
    python -m pip install pyinstaller
}

if (Test-Path "build") { Remove-Item -Recurse -Force "build" }
if (Test-Path "dist") { Remove-Item -Recurse -Force "dist" }

Write-Host "Building executable..." -ForegroundColor Green
python -m PyInstaller sora_tray.spec --clean

if (Test-Path "dist\sora_tray.exe") {
    Write-Host ""
    Write-Host "Build successful!" -ForegroundColor Green
    Write-Host "Executable: dist\sora_tray.exe" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "Build failed!" -ForegroundColor Red
    pause
    exit 1
}

pause

