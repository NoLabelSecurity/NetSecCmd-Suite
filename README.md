# NetCmd
# 🧩 Network Management Tool
Developer: Brian Lorick  
Organization: No/Label Security Services & Solutions  
Version: 1.1.0  
Created: February 5, 2025  
Last Updated:** October 20, 2025  

---

## 📘 Overview
The Network Management Tool is a Windows Batch-based utility designed to simplify and centralize essential network administration and system maintenance tasks.  
Through an interactive, menu-driven interface, it allows IT professionals to execute diagnostic, configuration, and monitoring commands quickly — without manually recalling complex syntax.

This tool is particularly useful for technicians, system administrators, and cybersecurity professionals who need a portable, script-based toolkit for troubleshooting and maintaining Windows systems.

---

## ⚙️ Features
- **Categorized Utilities**
  - Network Diagnostics  
  - Wi-Fi and Network Profiles  
  - Network Security and Firewall  
  - System Information and Maintenance  
  - System Networking and Configuration  
  - Miscellaneous Tools  

- **Built-In Capabilities**
  - View and monitor network connections  
  - Test connectivity (ping, tracert, nslookup)  
  - Manage Wi-Fi profiles and interfaces  
  - Inspect firewall status and reset TCP/IP stack  
  - Generate system diagnostic reports  
  - List installed software, uptime, and resource stats  

- **Design Highlights**
  - Interactive menu with input validation  
  - Loop prevention and safe navigation  
  - Modular structure for easy expansion  
  - Compatible with PowerShell integrations  

---

## 🧠 Technical Details
| Component | Description |
|------------|-------------|
| Language | Windows Batch Script |
| Platform | Windows 10/11 (Administrator Mode Recommended) |
| Dependencies | Built-in Windows tools (`netsh`, `netstat`, `ipconfig`, `wmic`, `nslookup`, `powershell`) |
| File Name | `NetworkManagementTool.bat` |

---

## 🚀 Usage
1. **Run as Administrator** for full functionality.  
2. Follow the on-screen menu prompts.  
3. Choose a category and tool to execute a network or system command.  
4. Press `CTRL + C` or select **Exit** to quit safely.  

### Example Commands:
- `netstat -ano` — View active network connections  
- `netsh wlan show profiles` — Display saved Wi-Fi profiles  
- `ipconfig /flushdns` — Clear DNS cache  
- `systeminfo` — Retrieve system details  
- `powershell -Command "Get-NetTCPConnection -State Listen"` — List open TCP ports  

---

## 📊 Example Menu Structure

======================================
NETWORK MANAGEMENT TOOL

1. Network Diagnostics
2. Wi-Fi and Network Profiles
3. Network Security and Firewall
4. System Information and Maintenance
5. System Networking and Configuration
6. Miscellaneous Network Tools
7. Exit
======================================

---

## 🧩 Project Impact
This tool streamlines network troubleshooting and system diagnostics for internal IT operations at **No/Label Security Services & Solutions**, enabling:
- Faster resolution of connectivity issues  
- Centralized command execution  
- Simplified maintenance workflows  

It demonstrates expertise in:
- Windows scripting and automation
- Network configuration and security 
- Systems diagnostics and administration 

---

## 🔐 License
**Internal / Personal Use Only**  
You may modify and adapt the script to suit your environment.  
Attribution is appreciated.

---

## 🛠️ Future Enhancements
- Exportable logs and reports (TXT/CSV/PDF)  
- PowerShell integration for advanced automation  
- GUI-based version for non-technical users  
- Remote system management (via SSH or WMI)

---

## ✉️ Contact
Developer: Brian Lorick  
Organization: No/Label Security Services & Solutions  
Email:

> “Simplify the complex. Automate the routine. Secure the system.”

---



