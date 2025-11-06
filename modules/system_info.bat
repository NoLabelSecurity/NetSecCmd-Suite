:: ===============================================================
:: MODULE: System Information and Maintenance
:: FILE:   system_info.bat
:: AUTHOR: Brian Lorick
:: ORG:    No/Label Security Services & Solutions
:: VERSION: 1.0.0
:: UPDATED: 11/06/2025
:: ===============================================================
:: PURPOSE:
:: Displays detailed system information, uptime, hardware data,
:: and system maintenance utilities for troubleshooting.
:: ===============================================================

@echo off
title NetSecCmd Suite - System Information & Maintenance
setlocal enabledelayedexpansion

:: --- Setup paths ---
set root=%~dp0..
set logs=%root%\logs
set report=%logs%\session_log.txt

:menu
cls
echo ======================================
echo     SYSTEM INFORMATION & MAINTENANCE
echo ======================================
echo 1. View Basic System Information
echo 2. View Detailed Hardware Information
echo 3. Check System Uptime
echo 4. List Installed Software
echo 5. View Running Processes
echo 6. Generate Full System Report
echo 7. Clean Temporary Files
echo 8. Return to Main Menu
echo ======================================
set /p sys_opt=Select an option (1-8): 

if "%sys_opt%"=="1" goto basic_info
if "%sys_opt%"=="2" goto hw_info
if "%sys_opt%"=="3" goto uptime
if "%sys_opt%"=="4" goto software_list
if "%sys_opt%"=="5" goto running_procs
if "%sys_opt%"=="6" goto sys_report
if "%sys_opt%"=="7" goto clean_temp
if "%sys_opt%"=="8" goto end
goto menu


:: ======================================
:: 1. BASIC SYSTEM INFO
:: ======================================
:basic_info
cls
echo [*] System Summary:
echo --------------------------------------
systeminfo | more
echo --------------------------------------
echo [%date% %time%] - Viewed system information >> "%report%"
pause
goto menu


:: ======================================
:: 2. HARDWARE DETAILS
:: ======================================
:hw_info
cls
echo [*] Hardware Details:
echo --------------------------------------
wmic computersystem get name, manufacturer, model, systemtype
wmic cpu get name, maxclockspeed, numberofcores, numberoflogicalprocessors
wmic memorychip get capacity, speed, manufacturer
echo --------------------------------------
echo [%date% %time%] - Viewed hardware information >> "%report%"
pause
goto menu


:: ======================================
:: 3. SYSTEM UPTIME
:: ======================================
:uptime
cls
echo [*] System Uptime:
echo --------------------------------------
net statistics workstation | find "Statistics since"
echo --------------------------------------
echo [%date% %time%] - Checked system uptime >> "%report%"
pause
goto menu


:: ======================================
:: 4. INSTALLED SOFTWARE
:: ======================================
:software_list
cls
echo [*] Installed Software:
echo --------------------------------------
wmic product get name, version | more
echo --------------------------------------
echo [%date% %time%] - Listed installed software >> "%report%"
pause
goto menu


:: ======================================
:: 5. RUNNING PROCESSES
:: ======================================
:running_procs
cls
echo [*] Running Processes:
echo --------------------------------------
tasklist | more
echo --------------------------------------
echo [%date% %time%] - Viewed running processes >> "%report%"
pause
goto menu


:: ======================================
:: 6. GENERATE SYSTEM REPORT
:: ======================================
:sys_report
cls
set out=%logs%\system_report_%date:~10,4%-%date:~4,2%-%date:~7,2%.txt
echo [*] Generating full system report...
(
    echo ==== SYSTEM INFORMATION ====
    systeminfo
    echo.
    echo ==== HARDWARE ====
    wmic computersystem get name, manufacturer, model, systemtype
    wmic cpu get name, maxclockspeed, numberofcores, numberoflogicalprocessors
    echo.
    echo ==== NETWORK ADAPTERS ====
    ipconfig /all
    echo.
    echo ==== RUNNING PROCESSES ====
    tasklist
) > "%out%"
echo [*] Report saved to: "%out%"
echo [%date% %time%] - Generated full system report >> "%report%"
pause
goto menu


:: ======================================
:: 7. CLEAN TEMPORARY FILES
:: ======================================
:clean_temp
cls
echo [!] Cleaning temporary files...
del /f /s /q "%TEMP%\*.*" >nul 2>&1
echo [*] Temporary files deleted successfully.
echo [%date% %time%] - Cleaned temporary files >> "%report%"
pause
goto menu


:: ======================================
:: RETURN TO MAIN MENU
:: ======================================
:end
cls
echo Returning to main menu...
timeout /t 1 >nul
exit /b

