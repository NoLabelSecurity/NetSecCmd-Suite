:: ===============================================================
:: MODULE: Network Security and Firewall
:: FILE:   firewall_security.bat
:: AUTHOR: Brian Lorick
:: ORG:    No/Label Security Services & Solutions
:: VERSION: 1.0.0
:: UPDATED: 11/06/2025
:: ===============================================================
:: PURPOSE:
:: Provides administrative tools for inspecting and configuring
:: Windows Firewall, active ports, and network security settings.
:: ===============================================================

@echo off
title NetSecCmd Suite - Firewall & Security
setlocal enabledelayedexpansion

:: --- Setup paths ---
set root=%~dp0..
set logs=%root%\logs
set report=%logs%\session_log.txt

:menu
cls
echo ======================================
echo      NETWORK SECURITY & FIREWALL MENU
echo ======================================
echo 1. View Windows Firewall Status
echo 2. Enable Windows Firewall (All Profiles)
echo 3. Disable Windows Firewall (All Profiles)
echo 4. Reset Windows Firewall to Default
echo 5. Show Active Listening Ports
echo 6. Reset TCP/IP Stack
echo 7. Flush DNS Cache
echo 8. Return to Main Menu
echo ======================================
set /p fw_opt=Select an option (1-8): 

if "%fw_opt%"=="1" goto fw_status
if "%fw_opt%"=="2" goto fw_enable
if "%fw_opt%"=="3" goto fw_disable
if "%fw_opt%"=="4" goto fw_reset
if "%fw_opt%"=="5" goto show_ports
if "%fw_opt%"=="6" goto reset_tcpip
if "%fw_opt%"=="7" goto flush_dns
if "%fw_opt%"=="8" goto end
goto menu


:: ======================================
:: 1. FIREWALL STATUS
:: ======================================
:fw_status
cls
echo [*] Windows Firewall Status:
echo --------------------------------------
netsh advfirewall show allprofiles
echo --------------------------------------
echo [%date% %time%] - Checked firewall status >> "%report%"
pause
goto menu


:: ======================================
:: 2. ENABLE FIREWALL (ALL PROFILES)
:: ======================================
:fw_enable
cls
echo [*] Enabling Windows Firewall for all profiles...
netsh advfirewall set allprofiles state on
echo [*] Firewall Enabled Successfully.
echo [%date% %time%] - Enabled firewall (all profiles) >> "%report%"
pause
goto menu


:: ======================================
:: 3. DISABLE FIREWALL (ALL PROFILES)
:: ======================================
:fw_disable
cls
echo [!] Disabling Windows Firewall for all profiles...
echo Confirm? (Y/N)
set /p confirm=
if /I "%confirm%" NEQ "Y" goto menu
netsh advfirewall set allprofiles state off
echo [!] Firewall Disabled.
echo [%date% %time%] - Disabled firewall (all profiles) >> "%report%"
pause
goto menu


:: ======================================
:: 4. RESET FIREWALL
:: ======================================
:fw_reset
cls
echo [*] Resetting Windows Firewall to Default Settings...
netsh advfirewall reset
echo [*] Firewall Reset Complete.
echo [%date% %time%] - Reset firewall settings >> "%report%"
pause
goto menu


:: ======================================
:: 5. SHOW ACTIVE LISTENING PORTS
:: ======================================
:show_ports
cls
echo [*] Active Listening Ports:
echo --------------------------------------
powershell -Command "Get-NetTCPConnection -State Listen | Select-Object -Property LocalAddress,LocalPort,OwningProcess | Sort-Object LocalPort | Format-Table -AutoSize"
echo --------------------------------------
echo [%date% %time%] - Viewed active listening ports >> "%report%"
pause
goto menu


:: ======================================
:: 6. RESET TCP/IP STACK
:: ======================================
:reset_tcpip
cls
echo [*] Resetting TCP/IP Stack...
netsh int ip reset
echo [*] TCP/IP Stack Reset Complete.
echo [%date% %time%] - Reset TCP/IP stack >> "%report%"
pause
goto menu


:: ======================================
:: 7. FLUSH DNS CACHE
:: ======================================
:flush_dns
cls
echo [*] Flushing DNS Cache...
ipconfig /flushdns
echo [*] DNS Cache Cleared.
echo [%date% %time%] - Flushed DNS cache >> "%report%"
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
