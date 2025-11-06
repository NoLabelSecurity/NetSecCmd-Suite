:: ===============================================================
:: MODULE: Miscellaneous Network Tools
:: FILE:   misc_tools.bat
:: AUTHOR: Brian Lorick
:: ORG:    No/Label Security Services & Solutions
:: VERSION: 1.0.0
:: UPDATED: 11/06/2025
:: ===============================================================
:: PURPOSE:
:: Provides additional tools for network analysis, host lookups,
:: port scanning, latency testing, and custom network utilities.
:: ===============================================================

@echo off
title NetSecCmd Suite - Miscellaneous Network Tools
setlocal enabledelayedexpansion

:: --- Setup paths ---
set root=%~dp0..
set logs=%root%\logs
set report=%logs%\session_log.txt

:menu
cls
echo ======================================
echo       MISCELLANEOUS NETWORK TOOLS
echo ======================================
echo 1. Public IP Lookup
echo 2. WHOIS Lookup
echo 3. Port Scan (PowerShell)
echo 4. Quick Host Latency Test
echo 5. Resolve Hostname to IP
echo 6. Resolve IP to Hostname
echo 7. Network Speed Test (PowerShell)
echo 8. Return to Main Menu
echo ======================================
set /p misc_opt=Select an option (1-8): 

if "%misc_opt%"=="1" goto public_ip
if "%misc_opt%"=="2" goto whois_lookup
if "%misc_opt%"=="3" goto port_scan
if "%misc_opt%"=="4" goto latency_test
if "%misc_opt%"=="5" goto host_to_ip
if "%misc_opt%"=="6" goto ip_to_host
if "%misc_opt%"=="7" goto speed_test
if "%misc_opt%"=="8" goto end
goto menu


:: ======================================
:: 1. PUBLIC IP LOOKUP
:: ======================================
:public_ip
cls
echo [*] Checking external IP address...
powershell -Command "(Invoke-WebRequest -UseBasicParsing https://api.ipify.org).Content"
echo [%date% %time%] - Checked external IP >> "%report%"
pause
goto menu


:: ======================================
:: 2. WHOIS LOOKUP
:: ======================================
:whois_lookup
cls
set /p domain=Enter domain or IP to query: 
if "%domain%"=="" goto menu
echo [*] WHOIS Lookup for "%domain%"
powershell -Command "try { (Invoke-RestMethod https://rdap.org/domain/%domain%) | Format-List } catch { Write-Host 'WHOIS lookup failed or unsupported domain.' }"
echo [%date% %time%] - Performed WHOIS lookup for "%domain%" >> "%report%"
pause
goto menu


:: ======================================
:: 3. PORT SCAN (POWERSHELL)
:: ======================================
:port_scan
cls
set /p target=Enter host/IP to scan: 
if "%target%"=="" goto menu
set /p port_range=Enter port range (e.g., 20..80): 
if "%port_range%"=="" set port_range=20..1024
echo [*] Scanning ports on %target% (this may take a while)...
powershell -Command "1..1024 | ForEach-Object { if (Test-NetConnection %target% -Port $_ -InformationLevel Quiet) { Write-Host ('Port ' + $_ + ' is OPEN') } }"
echo [%date% %time%] - Scanned ports %port_range% on %target% >> "%report%"
pause
goto menu


:: ======================================
:: 4. QUICK HOST LATENCY TEST
:: ======================================
:latency_test
cls
set /p host=Enter host/IP to test latency: 
if "%host%"=="" goto menu
ping -n 5 %host%
echo [%date% %time%] - Performed latency test for %host% >> "%report%"
pause
goto menu


:: ======================================
:: 5. RESOLVE HOSTNAME TO IP
:: ======================================
:host_to_ip
cls
set /p host=Enter hostname: 
if "%host%"=="" goto menu
nslookup %host%
echo [%date% %time%] - Resolved hostname %host% >> "%report%"
pause
goto menu


:: ======================================
:: 6. RESOLVE IP TO HOSTNAME
:: ======================================
:ip_to_host
cls
set /p ip=Enter IP address: 
if "%ip%"=="" goto menu
nslookup %ip%
echo [%date% %time%] - Resolved IP %ip% >> "%report%"
pause
goto menu


:: ======================================
:: 7. NETWORK SPEED TEST (POWERSHELL)
:: ======================================
:speed_test
cls
echo [*] Running basic speed test (downloading from CDN)...
powershell -Command "$url='http://ipv4.download.thinkbroadband.com/10MB.zip'; $out='$env:TEMP\speedtest.zip'; $wc=New-Object System.Net.WebClient; $t=Measure-Command { $wc.DownloadFile($url,$out) }; Write-Host ('Time: ' + $t.TotalSeconds + ' seconds'); Remove-Item $out"
echo [%date% %time%] - Ran network speed test >> "%report%"
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
