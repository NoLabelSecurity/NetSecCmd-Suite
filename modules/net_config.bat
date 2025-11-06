:: ===============================================================
:: MODULE: System Networking and Configuration
:: FILE:   net_config.bat
:: AUTHOR: Brian Lorick
:: ORG:    No/Label Security Services & Solutions
:: VERSION: 1.0.0
:: UPDATED: 11/06/2025
:: ===============================================================
:: PURPOSE:
:: Manage and configure network interfaces, IP addressing,
:: DNS settings, and network adapter functionality.
:: ===============================================================

@echo off
title NetSecCmd Suite - Network Configuration
setlocal enabledelayedexpansion

:: --- Setup paths ---
set root=%~dp0..
set logs=%root%\logs
set report=%logs%\session_log.txt

:menu
cls
echo ======================================
echo     NETWORKING & CONFIGURATION MENU
echo ======================================
echo 1. View All Network Configuration
echo 2. Release All IP Addresses
echo 3. Renew All IP Addresses
echo 4. Display Adapter Information
echo 5. Enable a Network Adapter
echo 6. Disable a Network Adapter
echo 7. Reset Network Adapter
echo 8. Display DNS Cache
echo 9. Flush DNS Cache
echo 10. Return to Main Menu
echo ======================================
set /p net_opt=Select an option (1-10): 

if "%net_opt%"=="1" goto view_all
if "%net_opt%"=="2" goto release_ip
if "%net_opt%"=="3" goto renew_ip
if "%net_opt%"=="4" goto adapter_info
if "%net_opt%"=="5" goto enable_adapter
if "%net_opt%"=="6" goto disable_adapter
if "%net_opt%"=="7" goto reset_adapter
if "%net_opt%"=="8" goto show_dns
if "%net_opt%"=="9" goto flush_dns
if "%net_opt%"=="10" goto end
goto menu


:: ======================================
:: 1. VIEW NETWORK CONFIGURATION
:: ======================================
:view_all
cls
echo [*] Full Network Configuration:
echo --------------------------------------
ipconfig /all
echo --------------------------------------
echo [%date% %time%] - Viewed network configuration >> "%report%"
pause
goto menu


:: ======================================
:: 2. RELEASE IP
:: ======================================
:release_ip
cls
echo [!] Releasing all IP addresses...
ipconfig /release
echo [*] IP addresses released.
echo [%date% %time%] - Released IP configuration >> "%report%"
pause
goto menu


:: ======================================
:: 3. RENEW IP
:: ======================================
:renew_ip
cls
echo [*] Renewing all IP addresses...
ipconfig /renew
echo [*] IP addresses renewed.
echo [%date% %time%] - Renewed IP configuration >> "%report%"
pause
goto menu


:: ======================================
:: 4. DISPLAY ADAPTER INFORMATION
:: ======================================
:adapter_info
cls
echo [*] Network Adapters and Status:
echo --------------------------------------
wmic nic get name, NetConnectionStatus, MACAddress, Speed
echo --------------------------------------
echo [%date% %time%] - Displayed adapter information >> "%report%"
pause
goto menu


:: ======================================
:: 5. ENABLE NETWORK ADAPTER
:: ======================================
:enable_adapter
cls
set /p adapter=Enter adapter name to enable: 
if "%adapter%"=="" goto menu
netsh interface set interface name="%adapter%" admin=ENABLED
echo [*] Adapter "%adapter%" enabled.
echo [%date% %time%] - Enabled adapter "%adapter%" >> "%report%"
pause
goto menu


:: ======================================
:: 6. DISABLE NETWORK ADAPTER
:: ======================================
:disable_adapter
cls
set /p adapter=Enter adapter name to disable: 
if "%adapter%"=="" goto menu
netsh interface set interface name="%adapter%" admin=DISABLED
echo [!] Adapter "%adapter%" disabled.
echo [%date% %time%] - Disabled adapter "%adapter%" >> "%report%"
pause
goto menu


:: ======================================
:: 7. RESET NETWORK ADAPTER
:: ======================================
:reset_adapter
cls
set /p adapter=Enter adapter name to reset: 
if "%adapter%"=="" goto menu
echo [*] Resetting adapter "%adapter%"...
netsh interface set interface name="%adapter%" admin=DISABLED
timeout /t 3 >nul
netsh interface set interface name="%adapter%" admin=ENABLED
echo [*] Adapter "%adapter%" reset successfully.
echo [%date% %time%] - Reset adapter "%adapter%" >> "%report%"
pause
goto menu


:: ======================================
:: 8. SHOW DNS CACHE
:: ======================================
:show_dns
cls
echo [*] DNS Cache Entries:
echo --------------------------------------
ipconfig /displaydns
echo --------------------------------------
echo [%date% %time%] - Displayed DNS cache >> "%report%"
pause
goto menu


:: ======================================
:: 9. FLUSH DNS CACHE
:: ======================================
:flush_dns
cls
echo [*] Flushing DNS cache...
ipconfig /flushdns
echo [*] DNS cache cleared.
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

