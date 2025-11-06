:: ===============================================================
:: MODULE: Shared Utility Functions
:: FILE:   shared_utils.bat
:: AUTHOR: Brian Lorick
:: ORG:    No/Label Security Services & Solutions
:: VERSION: 1.0.0
:: UPDATED: 11/06/2025
:: ===============================================================
:: PURPOSE:
:: Centralized library for shared functions and aesthetics.
:: Provides standardized logging, color output, input validation,
:: and screen formatting for NetSecCmd Suite.
:: ===============================================================

@echo off
setlocal enabledelayedexpansion

:: --- Setup paths ---
set root=%~dp0..
set logs=%root%\logs
set report=%logs%\session_log.txt

:: ===============================================================
:: FUNCTION: log
:: Writes timestamped events to the central session log.
:: Usage: call :log "Action description"
:: ===============================================================
:log
if "%~1"=="" goto :eof
echo [%date% %time%] - %~1 >> "%report%"
goto :eof


:: ===============================================================
:: FUNCTION: print_header
:: Displays a formatted title banner.
:: Usage: call :print_header "Title Text"
:: ===============================================================
:print_header
cls
if "%~1"=="" set msg=NetSecCmd Suite
if not "%~1"=="" set msg=%~1
echo ======================================
echo            !msg!
echo ======================================
goto :eof


:: ===============================================================
:: FUNCTION: pause_return
:: Standardized pause function.
:: Usage: call :pause_return
:: ===============================================================
:pause_return
echo.
echo Press any key to return to menu...
pause >nul
goto :eof


:: ===============================================================
:: FUNCTION: validate_input
:: Ensures a variable has a value.
:: Usage: call :validate_input "var_name" "fallback_label"
:: ===============================================================
:validate_input
set var=!%~1!
if "%var%"=="" (
    echo [!] Invalid input. Returning to menu...
    timeout /t 1 >nul
    goto %~2
)
goto :eof


:: ===============================================================
:: FUNCTION: color_text
:: Temporarily change CMD color scheme.
:: Usage: call :color_text "0A"
:: ===============================================================
:color_text
if "%~1"=="" goto :eof
color %~1
goto :eof


:: ===============================================================
:: FUNCTION: display_banner
:: Reads and displays ASCII banner from /assets/banner.txt
:: ===============================================================
:display_banner
if exist "%root%\assets\banner.txt" (
    type "%root%\assets\banner.txt"
) else (
    echo [NetSecCmd Suite]
)
goto :eof


:: ===============================================================
:: FUNCTION: check_admin
:: Confirms elevated privileges before running sensitive commands.
:: ===============================================================
:check_admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Please run this suite as Administrator.
    pause
    exit /b
)
goto :eof


:: ===============================================================
:: FUNCTION: log_section
:: Creates section headers in logs for readability.
:: Usage: call :log_section "Section Name"
:: ===============================================================
:log_section
echo. >> "%report%"
echo ==== %~1 ==== >> "%report%"
goto :eof


:: ===============================================================
:: FUNCTION: time_stamp
:: Returns a YYYY-MM-DD_HH-MM formatted timestamp.
:: ===============================================================
:time_stamp
for /f "tokens=2 delims==" %%a in ('"wmic os get localdatetime /value"') do set ts=%%a
set year=!ts:~0,4!
set month=!ts:~4,2!
set day=!ts:~6,2!
set hour=!ts:~8,2!
set minute=!ts:~10,2!
set timestamp=!year!-!month!-!day!_!hour!-!minute!
goto :eof

