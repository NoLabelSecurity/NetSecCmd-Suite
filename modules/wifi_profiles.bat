:: ===============================================================
:: MODULE: Wi-Fi and Network Profiles
:: FILE:   wifi_profiles.bat
:: AUTHOR: Brian Lorick
:: ORG:    No/Label Security Services & Solutions
:: VERSION: 1.0.0
:: UPDATED: 11/06/2025
:: ===============================================================
:: PURPOSE:
:: Manage and audit Wi-Fi profiles, view connected networks,
:: export saved credentials, and inspect interface details.
:: ===============================================================

@echo off
title NetSecCmd Suite - Wi-Fi & Network Profiles
setlocal enabledelayedexpansion

:: --- Setup paths ---
set root=%~dp0..
set logs=%root%\logs
set report=%logs%\session_log.txt

:menu
cls
echo ======================================
echo       WI-FI & NETWORK PROFILES MENU
echo ======================================
echo 1. View Current Wi-Fi Connection
echo 2. List All Saved Wi-Fi Profiles
echo 3. Show Wi-Fi Profile Details
echo 4. Export Wi-Fi Profiles (with keys)
echo 5. Display Wireless Interface Info
echo 6. Delete a Saved Wi-Fi Profile
echo 7. Return to Main Menu
echo ======================================
set /p wifi_opt=Select an option (1-7): 

if "%wifi_opt%"=="1" goto current_wifi
if "%wifi_opt%"=="2" goto list_profiles
if "%wifi_opt%"=="3" goto profile_details
if "%wifi_opt%"=="4" goto export_profiles
if "%wifi_opt%"=="5" goto interface_info
if "%wifi_opt%"=="6" goto delete_profile
if "%wifi_opt%"=="7" goto end
goto menu


:: ======================================
:: 1. VIEW CURRENT WI-FI CONNECTION
:: ======================================
:current_wifi
cls
echo [*] Current Wi-Fi Connection:
echo --------------------------------------
netsh wlan show interfaces
echo --------------------------------------
echo [%date% %time%] - Viewed current Wi-Fi connection >> "%report%"
pause
goto menu


:: ======================================
:: 2. LIST ALL SAVED WI-FI PROFILES
:: ======================================
:list_profiles
cls
echo [*] Saved Wi-Fi Profiles:
echo --------------------------------------
netsh wlan show profiles
echo --------------------------------------
echo [%date% %time%] - Listed Wi-Fi profiles >> "%report%"
pause
goto menu


:: ======================================
:: 3. SHOW PROFILE DETAILS
:: ======================================
:profile_details
cls
set /p prof=Enter profile name: 
if "%prof%"=="" goto menu
netsh wlan show profile name="%prof%" key=clear
echo [%date% %time%] - Viewed Wi-Fi profile details for "%prof%" >> "%report%"
pause
goto menu


:: ======================================
:: 4. EXPORT PROFILES (INCLUDES KEYS)
:: ======================================
:export_profiles
cls
set /p path=Enter export directory path (default: Desktop): 
if "%path%"=="" set path=%USERPROFILE%\Desktop
netsh wlan export profile folder="%path%" key=clear
echo [*] Wi-Fi profiles exported to: %path%
echo [%date% %time%] - Exported Wi-Fi profiles to "%path%" >> "%report%"
pause
goto menu


:: ======================================
:: 5. DISPLAY INTERFACE INFORMATION
:: ======================================
:interface_info
cls
echo [*] Wireless Interface Information:
echo --------------------------------------
netsh wlan show interfaces
echo --------------------------------------
echo [%date% %time%] - Displayed interface information >> "%report%"
pause
goto menu


:: ======================================
:: 6. DELETE A SAVED WI-FI PROFILE
:: ======================================
:delete_profile
cls
set /p delprof=Enter profile name to delete: 
if "%delprof%"=="" goto menu
netsh wlan delete profile name="%delprof%"
echo [%date% %time%] - Deleted Wi-Fi profile "%delprof%" >> "%report%"
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

