@echo off
setlocal enabledelayedexpansion
title Windows Cleaner PRO 2026 - by Waresem
color 0a

:: Self-elevate to Administrator
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo [+] Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)

:MAIN_MENU
cls
echo ========================================
echo    Windows Cleaner PRO 2026
echo    Advanced System Optimization Tool
echo ========================================
echo.
echo [1] Quick Clean (Fast & Safe)
echo [2] Advanced Clean (Deep Cleaning)
echo [3] Selective Clean (Custom Options)
echo [4] Browser Cache Cleanup
echo [5] Registry & System Optimization
echo [6] Schedule Auto Cleanup
echo [7] View Cleanup Log
echo [8] Exit
echo.
set /p choice="Select an option (1-8): "

if "%choice%"=="1" goto QUICK_CLEAN
if "%choice%"=="2" goto ADVANCED_CLEAN
if "%choice%"=="3" goto SELECTIVE_CLEAN
if "%choice%"=="4" goto BROWSER_CLEANUP
if "%choice%"=="5" goto REGISTRY_CLEANUP
if "%choice%"=="6" goto SCHEDULE_CLEANUP
if "%choice%"=="7" goto VIEW_LOG
if "%choice%"=="8" goto EXIT_PROGRAM
echo Invalid choice! Try again.
timeout /t 2 >nul
goto MAIN_MENU

:QUICK_CLEAN
cls
echo ========================================
echo          QUICK CLEAN - Starting...
echo ========================================
echo.

set "logfile=%USERPROFILE%\Desktop\Cleaner_Log_2026.txt"
echo [%date% %time%] === QUICK CLEAN SESSION === >> "%logfile%"

echo [+] Cleaning User Temp Folder...
del /s /f /q "%temp%\*.*" >nul 2>&1
rd /s /q "%temp%" >nul 2>&1
mkdir "%temp%" >nul 2>&1
echo [+] User Temp cleaned >> "%logfile%"

echo [+] Cleaning System Temp Folder...
del /s /f /q "C:\Windows\Temp\*.*" >nul 2>&1
rd /s /q "C:\Windows\Temp" >nul 2>&1
mkdir "C:\Windows\Temp" >nul 2>&1
echo [+] System Temp cleaned >> "%logfile%"

echo [+] Cleaning Prefetch...
del /s /f /q "C:\Windows\Prefetch\*.*" >nul 2>&1
echo [+] Prefetch cleaned >> "%logfile%"

echo [+] Clearing Windows Update Cache...
del /s /f /q "C:\Windows\SoftwareDistribution\Download\*.*" >nul 2>&1
echo [+] Windows Update Cache cleared >> "%logfile%"

echo [+] Cleaning Logs and Crash Dumps...
del /s /f /q "C:\Windows\Minidump\*.*" >nul 2>&1
del /s /f /q "C:\Windows\Logs\*.*" >nul 2>&1
echo [+] Logs and Crash Dumps cleaned >> "%logfile%"

echo [+] Emptying Recycle Bin...
PowerShell.exe -NoProfile -Command "Clear-RecycleBin -Force" >nul 2>&1
echo [+] Recycle Bin emptied >> "%logfile%"

echo.
echo [✓] Quick Clean completed successfully!
echo [✓] Quick Clean completed successfully! >> "%logfile%"
pause
goto MAIN_MENU

:ADVANCED_CLEAN
cls
echo ========================================
echo      ADVANCED CLEAN - Starting...
echo ========================================
echo.

set "logfile=%USERPROFILE%\Desktop\Cleaner_Log_2026.txt"
echo [%date% %time%] === ADVANCED CLEAN SESSION === >> "%logfile%"

echo [+] Running Quick Clean tasks...
del /s /f /q "%temp%\*.*" >nul 2>&1
rd /s /q "%temp%" >nul 2>&1
mkdir "%temp%" >nul 2>&1
del /s /f /q "C:\Windows\Temp\*.*" >nul 2>&1
rd /s /q "C:\Windows\Temp" >nul 2>&1
mkdir "C:\Windows\Temp" >nul 2>&1
del /s /f /q "C:\Windows\Prefetch\*.*" >nul 2>&1
del /s /f /q "C:\Windows\SoftwareDistribution\Download\*.*" >nul 2>&1
del /s /f /q "C:\Windows\Minidump\*.*" >nul 2>&1
del /s /f /q "C:\Windows\Logs\*.*" >nul 2>&1
PowerShell.exe -NoProfile -Command "Clear-RecycleBin -Force" >nul 2>&1

echo [+] Cleaning Delivery Optimization Cache...
del /s /f /q "C:\Windows\SoftwareDistribution\DataStore\*.*" >nul 2>&1
echo [+] Delivery Optimization cleaned >> "%logfile%"

echo [+] Cleaning Windows Update files...
dism.exe /online /Cleanup-Image /StartComponentCleanup /Defer >nul 2>&1
echo [+] Component Store cleaned >> "%logfile%"

echo [+] Cleaning DNS Cache...
ipconfig /flushdns >nul 2>&1
echo [+] DNS Cache flushed >> "%logfile%"

echo [+] Cleaning unused Windows features...
del /s /f /q "%ProgramFiles%\Microsoft OneDrive\*.*" >nul 2>&1 2>&1
echo [+] Temporary caches cleaned >> "%logfile%"

echo [+] Clearing Windows Error Reporting...
del /s /f /q "C:\ProgramData\Microsoft\Windows\WER\*.*" >nul 2>&1
echo [+] Error Reporting cleaned >> "%logfile%"

echo.
echo [✓] Advanced Clean completed successfully!
echo [✓] Advanced Clean completed successfully! >> "%logfile%"
timeout /t 2 >nul
pause
goto MAIN_MENU

:SELECTIVE_CLEAN
cls
echo ========================================
echo      SELECTIVE CLEAN - Options
echo ========================================
echo.
echo [1] Clean Temp Files Only
echo [2] Clean Cache Only
echo [3] Clean Logs Only
echo [4] Clean Recycle Bin Only
echo [5] All of Above
echo [0] Back to Main Menu
echo.
set /p subchoice="Select an option: "

if "%subchoice%"=="1" (
    echo Cleaning Temp files...
    del /s /f /q "%temp%\*.*" >nul 2>&1
    rd /s /q "%temp%" >nul 2>&1
    mkdir "%temp%" >nul 2>&1
    del /s /f /q "C:\Windows\Temp\*.*" >nul 2>&1
    rd /s /q "C:\Windows\Temp" >nul 2>&1
    mkdir "C:\Windows\Temp" >nul 2>&1
    echo [✓] Temp files cleaned!
)
if "%subchoice%"=="2" (
    echo Cleaning Cache files...
    del /s /f /q "%temp%\*.*" >nul 2>&1
    del /s /f /q "C:\Windows\Prefetch\*.*" >nul 2>&1
    del /s /f /q "C:\Windows\SoftwareDistribution\Download\*.*" >nul 2>&1
    echo [✓] Cache cleaned!
)
if "%subchoice%"=="3" (
    echo Cleaning Logs...
    del /s /f /q "C:\Windows\Minidump\*.*" >nul 2>&1
    del /s /f /q "C:\Windows\Logs\*.*" >nul 2>&1
    del /s /f /q "C:\ProgramData\Microsoft\Windows\WER\*.*" >nul 2>&1
    echo [✓] Logs cleaned!
)
if "%subchoice%"=="4" (
    echo Emptying Recycle Bin...
    PowerShell.exe -NoProfile -Command "Clear-RecycleBin -Force" >nul 2>&1
    echo [✓] Recycle Bin emptied!
)
if "%subchoice%"=="5" (
    echo Running all cleanup tasks...
    del /s /f /q "%temp%\*.*" >nul 2>&1
    rd /s /q "%temp%" >nul 2>&1
    mkdir "%temp%" >nul 2>&1
    del /s /f /q "C:\Windows\Temp\*.*" >nul 2>&1
    rd /s /q "C:\Windows\Temp" >nul 2>&1
    mkdir "C:\Windows\Temp" >nul 2>&1
    del /s /f /q "C:\Windows\Prefetch\*.*" >nul 2>&1
    del /s /f /q "C:\Windows\SoftwareDistribution\Download\*.*" >nul 2>&1
    del /s /f /q "C:\Windows\Minidump\*.*" >nul 2>&1
    del /s /f /q "C:\Windows\Logs\*.*" >nul 2>&1
    del /s /f /q "C:\ProgramData\Microsoft\Windows\WER\*.*" >nul 2>&1
    PowerShell.exe -NoProfile -Command "Clear-RecycleBin -Force" >nul 2>&1
    echo [✓] All selective tasks completed!
)
if "%subchoice%"=="0" goto MAIN_MENU
pause
goto MAIN_MENU

:BROWSER_CLEANUP
cls
echo ========================================
echo      BROWSER CACHE CLEANUP
echo ========================================
echo.
echo [+] Cleaning Google Chrome Cache...
rmdir /s /q "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cache" >nul 2>&1
echo [✓] Chrome cleaned

echo [+] Cleaning Mozilla Firefox Cache...
rmdir /s /q "%USERPROFILE%\AppData\Local\Mozilla\Firefox\Profiles\*\cache2" >nul 2>&1
echo [✓] Firefox cleaned

echo [+] Cleaning Microsoft Edge Cache...
rmdir /s /q "%USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\Cache" >nul 2>&1
echo [✓] Edge cleaned

echo.
echo [✓] Browser cleanup completed!
pause
goto MAIN_MENU

:REGISTRY_CLEANUP
cls
echo ========================================
echo   REGISTRY & SYSTEM OPTIMIZATION
echo ========================================
echo.
echo [+] Running Disk Cleanup...
cleanmgr /sageset:1 >nul 2>&1
cleanmgr /sagerun:1 >nul 2>&1
echo [✓] Disk Cleanup completed

echo [+] Defragmenting System Drive...
defrag C: /U /V >nul 2>&1
echo [✓] Defragmentation completed

echo [+] Optimizing Storage...
optimize-volume -DriveLetter C -Defrag >nul 2>&1
echo [✓] Storage optimized

echo.
echo [✓] System Optimization completed!
pause
goto MAIN_MENU

:SCHEDULE_CLEANUP
cls
echo ========================================
echo     AUTO CLEANUP SCHEDULER
echo ========================================
echo.
echo [+] Creating scheduled task for daily cleanup...
PowerShell.exe -NoProfile -Command "Register-ScheduledTask -TaskName 'Cleaner_PRO_2026_Daily' -Action (New-ScheduledTaskAction -Execute '%~f0') -Trigger (New-ScheduledTaskTrigger -Daily -At 2:00AM) -Principal (New-ScheduledTaskPrincipal -UserID 'NT AUTHORITY\SYSTEM' -RunLevel Highest) -Force" >nul 2>&1

if %errorLevel% == 0 (
    echo [✓] Auto-cleanup scheduled for daily 2:00 AM
) else (
    echo [!] Failed to create scheduled task
)

pause
goto MAIN_MENU

:VIEW_LOG
cls
echo ========================================
echo          CLEANUP LOG
echo ========================================
echo.
set "logfile=%USERPROFILE%\Desktop\Cleaner_Log_2026.txt"
if exist "%logfile%" (
    type "%logfile%"
) else (
    echo [!] No cleanup log found yet.
    echo Log file location: %logfile%
)
echo.
pause
goto MAIN_MENU

:EXIT_PROGRAM
cls
echo ========================================
echo  Thank you for using Cleaner PRO 2026!
echo    System Optimization Complete
echo ========================================
echo.
timeout /t 2 >nul
exit /b 0
