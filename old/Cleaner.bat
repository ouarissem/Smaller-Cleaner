@echo off
title Windows Cleaner by Waresem 2025
color 0a

:: Self-elevate to Administrator
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo [+] Requesting admin privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)

echo ========================================
echo          Windows Cleaner (Safe)
echo ========================================
echo.

:: Clean User Temp
echo [+] Cleaning User Temp...
del /s /f /q "%temp%\*.*" >nul 2>&1
rd /s /q "%temp%" >nul 2>&1
mkdir "%temp%" >nul 2>&1

:: Clean System Temp
echo [+] Cleaning System Temp...
del /s /f /q "C:\Windows\Temp\*.*" >nul 2>&1
rd /s /q "C:\Windows\Temp" >nul 2>&1
mkdir "C:\Windows\Temp" >nul 2>&1

:: Clean Prefetch
echo [+] Cleaning Prefetch...
del /s /f /q "C:\Windows\Prefetch\*.*" >nul 2>&1

:: Clean old Windows Update files
echo [+] Cleaning Windows Update cache...
del /s /f /q "C:\Windows\SoftwareDistribution\Download\*.*" >nul 2>&1

:: Clean Crash Dumps and Logs
echo [+] Cleaning Logs and Crash Dumps...
del /s /f /q "C:\Windows\Minidump\*.*" >nul 2>&1
del /s /f /q "C:\Windows\Logs\*.*" >nul 2>&1

:: Clean Delivery Optimization
echo [+] Cleaning Delivery Optimization cache...
del /s /f /q "C:\Windows\SoftwareDistribution\DataStore\*.*" >nul 2>&1

:: Empty Recycle Bin
echo [+] Emptying Recycle Bin...
PowerShell.exe -NoProfile -Command "Clear-RecycleBin -Force" >nul 2>&1

echo.
echo [✓] Cleaning completed successfully!
pause
exit
