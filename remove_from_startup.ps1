try {
    $RegPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
    Remove-ItemProperty -Path $RegPath -Name "SoraTray" -ErrorAction Stop
    Write-Host "Successfully removed from startup!" -ForegroundColor Green
} catch {
    Write-Host "INFO: Sora Tray was not in startup list." -ForegroundColor Yellow
}

pause

