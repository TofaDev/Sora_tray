$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ExePath = Join-Path $ScriptDir "dist\sora_tray.exe"

if (-not (Test-Path $ExePath)) {
    Write-Host "ERROR: sora_tray.exe not found in dist folder!" -ForegroundColor Red
    pause
    exit 1
}

$FullPath = (Resolve-Path $ExePath).Path

try {
    $RegPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
    Set-ItemProperty -Path $RegPath -Name "SoraTray" -Value "`"$FullPath`"" -ErrorAction Stop
    Write-Host "Successfully added to startup!" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Failed to add to startup registry!" -ForegroundColor Red
}

pause

