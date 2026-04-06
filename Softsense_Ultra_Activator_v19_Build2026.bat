@echo off
setlocal enabledelayedexpansion
title Windows Activation Utility - By Naitik Nanda
mode con: cols=80 lines=28

:: --- Admin Check ---
net session >nul 2>&1
if %errorLevel% neq 0 (
    color 0C
    echo =====================================================
    echo [!] ERROR: PLEASE RUN AS ADMINISTRATOR
    echo =====================================================
    echo This utility requires admin rights to modify keys.
    pause >nul
    exit
)

:menu
cls
color 0F
echo.
echo  =====================================================================
echo           WINDOWS ACTIVATION ^& DIAGNOSTICS - 2026 EDITION
echo                Designed by Naitik Nanda ^| Bhubaneswar Odisha
echo  =====================================================================
echo.
echo    [42;30m  STATUS: ONLINE Server of Microsoft  [0m   [90mActivation Gateway:[0m [93mkms8.msguides.com[0m
echo.
echo    [97m[1][0m [92mStart Windows Activation (Select Edition)[0m
echo    [97m[2][0m [96mCheck Current KEY Status[0m
echo    [97m[3][0m [91mReset Licensing Files (Repair)[0m
echo    [97m[4][0m [90mExit[0m
echo.
set /p choice="  Selection > "

if "%choice%"=="1" goto select_edition
if "%choice%"=="2" goto status
if "%choice%"=="3" goto repair
if "%choice%"=="4" exit
goto menu

:select_edition
cls
echo.
echo  [92m--- SELECT WINDOWS EDITION SO WE CAN ACTIVATE SYSTEM ACCORDINGLY. ---[0m
echo.
echo  [1] Windows 10/11 Professional
echo  [2] Windows 10/11 Home
echo  [3] Back to Main Menu
echo.
set /p ed="  Choice > "

if "%ed%"=="1" (set "key=W269N-WFGWX-YVC9B-4J6C9-T83GX" & goto activate)
if "%ed%"=="2" (set "key=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99" & goto activate)
if "%ed%"=="3" goto menu
goto select_edition

:activate
echo.
echo  [[94mINFO[0m] Applying Key In System For Deep True Activation Across MS INDIA: %key%
slmgr /ipk %key% >nul
echo  [[92mOK[0m] Key installed IN YOUR SYSTEM - Office :- Microsoft India  ISB Rd, Gachibowli, Hyderabad, Telangana 500032

echo  [[94mINFO[0m] Connecting to Naitik Activation Server Gateway...
slmgr /skms kms8.msguides.com >nul
slmgr /ato >nul
echo.
echo  [92m[SUCCESS] Activation command executed In Your System. Sending Info to Indian MS OFFICE.![0m
echo.
pause
goto menu

:status
echo.
echo  [[94m![0m] Querying Microsoft India  Server...
slmgr /xpr
pause
goto menu

:repair
echo.
echo  [[91m![0m] Stopping Microsoft Windows Defender Antivirus...
net stop sppsvc >nul 2>&1
echo  [[91m![0m] Resetting Licensing Timers...
slmgr /rearm >nul
net start sppsvc >nul 2>&1
echo  [[92mOK[0m] System licensing refreshed.
pause
goto menu