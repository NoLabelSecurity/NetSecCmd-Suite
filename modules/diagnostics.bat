:: ===============================================================
:: MODULE: Network Diagnostics
:: FILE:   diagnostics.bat
:: AUTHOR: Brian Lorick
:: ORG:    No/Label Security Services & Solutions
:: VERSION: 1.0.0
:: UPDATED: 11/06/2025
:: ===============================================================
:: PURPOSE:
:: Provides a set of diagnostic utilities for testing and
:: troubleshooting network connectivity, routing, and DNS.
:: ===============================================================

@echo off
title NetSecCmd Suite - Network Diagnostics
setlocal enabledelayedexpansion

:: --- Setup paths ---
set root=%~dp0..
set logs=%root%\logs
set report=%logs%\session_log.txt

:menu
cls
echo ======================================
echo        NETWORK DIAGNOSTICS MENU
echo ======================================
echo 1. View Active Network Connections
echo 2. Display Network Statistics
echo 3. Monitor Real-Time Connections
echo 4. Show ARP Table
echo 5. Test Connectivity (Ping)
echo 6. Trace Network Route
echo 7. Check DNS Resolution
echo 8. Return to Main Menu
echo ======================================
set /p diag_opt=Select an option (1-8): 

if "%diag_opt%"=="1" goto netstat_all
if "%diag_opt%"=="2" goto netstat_stats
if "%diag_opt%"=="3" goto netstat_live
if "%diag_opt%"=="4" goto arp_table
if "%diag_opt%"=="5" goto ping_test
if "%diag_opt%"=="6" goto tracert_route
if "%diag_opt%"=="7" goto nslookup_test
if "%diag_opt%"=="8" goto end
goto menu


:: ======================================
:: 1. NETSTAT (All Connections)
:: ======================================
:netstat_all
cls
echo [*] Active Connections:
echo --------------------------------------
netstat -ano | more
echo --------------------------------------
echo [%date% %time%] - Ran: netstat -ano >> "%report%"
pause
goto menu

:: ======================================
:: 2. NETSTAT (Statistics)
:: ======================================
:netstat_stats
cls
echo [*] Network Statistics Summary:
echo --------------------------------------
netstat -e -s
echo --------------------------------------
echo [%date% %time%] - Ran: netstat -e -s >> "%report%"
pause
goto menu

:: ======================================
:: 3. NETSTAT (Live Monitor)
:: ======================================
:netstat_live
cls
echo [*] Monitoring Active Connections (Ctrl+C to Stop)
echo --------------------------------------
netstat -an 5
echo --------------------------------------
echo [%date% %time%] - Ran: netstat -an 5 >> "%report%"
pause
goto menu

:: ======================================
:: 4. ARP TABLE
:: ======================================
:arp_table
cls
echo [*] ARP Table:
echo --------------------------------------
arp -a
echo --------------------------------------
echo [%date% %time%] - Ran: arp -a >> "%report%"
pause
goto menu

:: ======================================
:: 5. PING TEST
:: ======================================
:ping_test
cls
set /p host=Enter host/IP to ping: 
if "%host%"=="" goto menu
ping %host%
echo [%date% %time%] - Ran: ping %host% >> "%report%"
pause
goto menu

:: ======================================
:: 6. TRACERT
:: ======================================
:tracert_route
cls
set /p target=Enter host/IP to trace: 
if "%target%"=="" goto menu
tracert %target%
echo [%date% %time%] - Ran: tracert %target% >> "%report%"
pause
goto menu

:: ======================================
:: 7. DNS CHECK
:: ======================================
:nslookup_test
cls
set /p domain=Enter domain to check: 
if "%domain%"=="" goto menu
nslookup %domain%
echo [%date% %time%] - Ran: nslookup %domain% >> "%report%"
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
