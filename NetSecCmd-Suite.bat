:: ===============================================================
::                       NetSecCmd-Suite
:: ===============================================================
::  Developer:        [Brian Lorick]
::  Organization:     [No/Label Security Services & Solutions]
::  Created On:       [MM/DD/YYYY]
::  Last Modified:    [MM/DD/YYYY]
::  Version:          1.0.0
::
::  Description:
::      This batch-based network management utility provides
::      categorized tools for diagnostics, Wi-Fi configuration,
::      network security, and system maintenance. It allows users
::      to quickly execute and monitor common network and system
::      commands in one unified interface.
::
::  Features:
::      - Categorized network utilities (Diagnostics, Wi-Fi, Security, etc.)
::      - Interactive menu system with input validation
::      - Loop prevention and safe navigation
::      - Easy-to-extend structure for adding new tools
::
::  Usage:
::      1. Run as Administrator for full functionality.
::      2. Follow on-screen prompts to navigate categories.
::      3. Choose "Exit" or press CTRL+C to quit safely.
::
::  Notes:
::      - Some commands may require elevated privileges.
::      - Logs and reports can be added or redirected as needed.
::
::  License:
::      Internal / Personal Use Only. Modify as needed for your environment.
:: ===============================================================

@echo off
setlocal enabledelayedexpansion
set desktop=%USERPROFILE%\Desktop
set report=%desktop%\cmd_report.txt

:: ======================================
:: MAIN MENU
:: ======================================
:main_menu
cls
echo ======================================
echo           NetSecCmd-Suite
echo             -   -   -
echo             MAIN MENU
echo ======================================
echo 1. Network Diagnostics
echo 2. Wi-Fi and Network Profiles
echo 3. Network Security and Firewall
echo 4. System Information and Maintenance
echo 5. System Networking and Configuration
echo 6. Miscellaneous Network Tools
echo 7. Exit
echo ======================================
set /p main_choice="Select a category: "

if "%main_choice%"=="1" goto diagnostics_menu
if "%main_choice%"=="2" goto wifi_menu
if "%main_choice%"=="3" goto security_menu
if "%main_choice%"=="4" goto system_menu
if "%main_choice%"=="5" goto config_menu
if "%main_choice%"=="6" goto misc_menu
if "%main_choice%"=="7" exit
goto main_menu

:: ======================================
:: CATEGORY 1: NETWORK DIAGNOSTICS
:: ======================================
:diagnostics_menu
cls
echo ======================================
echo        NETWORK DIAGNOSTICS
echo ======================================
echo 1. View all active network connections
echo 2. View detailed network statistics
echo 3. Monitor connections in real-time
echo 4. Display ARP table
echo 5. Test network connectivity (ping)
echo 6. Trace network route (tracert)
echo 7. Check DNS resolution (nslookup)
echo 8. List listening ports
echo 9. Check for open ports
echo 10. Show DNS client cache
echo 11. Check network interfaces status
echo 12. View system event logs (network related)
echo 13. Get default gateway IP address
echo 14. Show Windows network shares
echo 15. Test network bandwidth
echo 16. View TCP connections (listening ports)
echo 17. Show Wi-Fi signal strength
echo 18. View network configuration for a specific interface
echo 19. View IP configuration for all adapters
echo 0. Back to Main Menu
set /p choice="Enter your choice: "
if "%choice%"=="0" goto main_menu

:: Map to original command labels
if "%choice%"=="1" goto active_connections
if "%choice%"=="2" goto network_stats
if "%choice%"=="3" goto realtime_monitor
if "%choice%"=="4" goto arp_table
if "%choice%"=="5" goto ping_test
if "%choice%"=="6" goto tracert_test
if "%choice%"=="7" goto dns_resolution
if "%choice%"=="8" goto listening_ports
if "%choice%"=="9" goto open_ports
if "%choice%"=="10" goto dns_cache
if "%choice%"=="11" goto network_interfaces
if "%choice%"=="12" goto event_logs
if "%choice%"=="13" goto default_gateway
if "%choice%"=="14" goto network_shares
if "%choice%"=="15" goto bandwidth_test
if "%choice%"=="16" goto tcp_connections
if "%choice%"=="17" goto wifi_signal
if "%choice%"=="18" goto interface_config
if "%choice%"=="19" goto ip_configuration
goto diagnostics_menu


:: ======================================
:: CATEGORY 2: WI-FI AND NETWORK PROFILES
:: ======================================
:wifi_menu
cls
echo ======================================
echo      WI-FI AND NETWORK PROFILES
echo ======================================
echo 1. View saved Wi-Fi profiles
echo 2. Get details of a specific Wi-Fi network
echo 3. Scan for nearby Wi-Fi networks
echo 4. List all network interfaces
echo 5. Show system services
echo 0. Back to Main Menu
set /p choice="Enter your choice: "
if "%choice%"=="0" goto main_menu

if "%choice%"=="1" goto wifi_profiles
if "%choice%"=="2" goto wifi_details
if "%choice%"=="3" goto scan_wifi
if "%choice%"=="4" goto network_adapters
if "%choice%"=="5" goto services
goto wifi_menu


:: ======================================
:: CATEGORY 3: NETWORK SECURITY AND FIREWALL
:: ======================================
:security_menu
cls
echo ======================================
echo     NETWORK SECURITY AND FIREWALL
echo ======================================
echo 1. Check firewall status
echo 2. Flush DNS cache
echo 3. Reset TCP/IP stack
echo 4. Check date and time settings
echo 0. Back to Main Menu
set /p choice="Enter your choice: "
if "%choice%"=="0" goto main_menu

if "%choice%"=="1" goto firewall_status
if "%choice%"=="2" goto flush_dns
if "%choice%"=="3" goto reset_tcpip
if "%choice%"=="4" goto date_time
goto security_menu


:: ======================================
:: CATEGORY 4: SYSTEM INFORMATION AND MAINTENANCE
:: ======================================
:system_menu
cls
echo ======================================
echo   SYSTEM INFORMATION AND MAINTENANCE
echo ======================================
echo 1. View system information
echo 2. List installed software
echo 3. Check time synchronization status
echo 4. Generate system diagnostics report
echo 5. Run system file checker (sfc)
echo 6. View system resource usage
echo 7. Show system uptime
echo 8. Show system boot time
echo 9. Show active RDP sessions
echo 0. Back to Main Menu
set /p choice="Enter your choice: "
if "%choice%"=="0" goto main_menu

if "%choice%"=="1" goto system_info
if "%choice%"=="2" goto installed_software
if "%choice%"=="3" goto time_sync
if "%choice%"=="4" goto system_report
if "%choice%"=="5" goto sfc_scan
if "%choice%"=="6" goto resource_usage
if "%choice%"=="7" goto system_uptime
if "%choice%"=="8" goto boot_time
if "%choice%"=="9" goto rdp_sessions
goto system_menu


:: ======================================
:: CATEGORY 5: SYSTEM NETWORKING AND CONFIGURATION
:: ======================================
:config_menu
cls
echo ======================================
echo  SYSTEM NETWORKING AND CONFIGURATION
echo ======================================
echo 1. Display routing table
echo 2. List active system sessions
echo 3. Show running processes
echo 4. Check disk health
echo 0. Back to Main Menu
set /p choice="Enter your choice: "
if "%choice%"=="0" goto main_menu

if "%choice%"=="1" goto routing_table
if "%choice%"=="2" goto active_sessions
if "%choice%"=="3" goto running_processes
if "%choice%"=="4" goto disk_health
goto config_menu


:: ======================================
:: CATEGORY 6: MISCELLANEOUS NETWORK TOOLS
:: ======================================
:misc_menu
cls
echo ======================================
echo     MISCELLANEOUS NETWORK TOOLS
echo ======================================
echo 1. Exit
echo 0. Back to Main Menu
set /p choice="Enter your choice: "
if "%choice%"=="0" goto main_menu
if "%choice%"=="1" exit
goto misc_menu


:: ======================================
:: COMMAND IMPLEMENTATIONS (original)
:: ======================================
:active_connections
netstat -ano
pause
goto diagnostics_menu

:network_stats
netstat -s
pause
goto diagnostics_menu

:realtime_monitor
echo Running as administrator is required.
netstat -anob
pause
goto diagnostics_menu

:wifi_profiles
netsh wlan show profiles
pause
goto wifi_menu

:wifi_details
set /p ssid="Enter the SSID of the network: "
netsh wlan show profile name="%ssid%" key=clear
pause
goto wifi_menu

:scan_wifi
netsh wlan show networks mode=bssid
pause
goto wifi_menu

:arp_table
arp -a
pause
goto diagnostics_menu

:ping_test
set /p target="Enter the hostname or IP to ping: "
ping %target%
pause
goto diagnostics_menu

:tracert_test
set /p target="Enter the hostname or IP to trace: "
tracert %target%
pause
goto diagnostics_menu

:dns_resolution
set /p target="Enter the hostname for DNS resolution: "
nslookup %target%
pause
goto diagnostics_menu

:listening_ports
netstat -an | find "LISTENING"
pause
goto diagnostics_menu

:firewall_status
netsh advfirewall show allprofiles
pause
goto security_menu

:flush_dns
ipconfig /flushdns
echo DNS cache has been flushed.
pause
goto security_menu

:reset_tcpip
netsh int ip reset
echo TCP/IP stack has been reset. Restart required.
pause
goto security_menu

:routing_table
route print
pause
goto config_menu

:system_info
systeminfo
pause
goto system_menu

:installed_software
wmic product get name,version
pause
goto system_menu

:time_sync
w32tm /query /status
pause
goto system_menu

:system_report
perfmon /report
echo Generating system diagnostics report...
pause
goto system_menu

:sfc_scan
sfc /scannow
pause
goto system_menu

:open_ports
powershell -Command "Get-NetTCPConnection -State Listen"
pause
goto diagnostics_menu

:dns_cache
ipconfig /displaydns
pause
goto diagnostics_menu

:network_interfaces
ipconfig /all
pause
goto diagnostics_menu

:event_logs
eventvwr.msc /s
pause
goto diagnostics_menu

:default_gateway
ipconfig | findstr /i "Gateway"
pause
goto diagnostics_menu

:network_shares
net share
pause
goto diagnostics_menu

:bandwidth_test
powershell -Command "Test-Connection google.com -Count 10"
pause
goto diagnostics_menu

:active_sessions
query user
pause
goto config_menu

:running_processes
tasklist
pause
goto config_menu

:resource_usage
systeminfo | findstr /C:"Total Physical Memory" /C:"Available Physical Memory"
pause
goto system_menu

:system_uptime
net stats srv
pause
goto system_menu

:network_adapters
wmic nic get Name, NetConnectionStatus, MACAddress, Speed
pause
goto wifi_menu

:tcp_connections
netstat -an | findstr "TCP"
pause
goto diagnostics_menu

:date_time
date /T
time /T
pause
goto security_menu

:wifi_signal
netsh wlan show interfaces | findstr /i "Signal"
pause
goto diagnostics_menu

:interface_config
netsh interface ip show config name="Ethernet"
pause
goto diagnostics_menu

:disk_health
chkdsk
pause
goto config_menu

:services
sc query
pause
goto wifi_menu

:ip_configuration
ipconfig /all
pause
goto diagnostics_menu

:boot_time
systeminfo | findstr /C:"Boot Time"
pause
goto system_menu

:rdp_sessions
query session
pause
goto system_menu
