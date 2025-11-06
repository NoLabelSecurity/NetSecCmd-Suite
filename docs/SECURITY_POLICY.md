# 🔐 Security & Usage Policy

## Authorized Use
NetSecCmd Suite is designed for internal network diagnostics, administration, and troubleshooting by authorized IT professionals.

**Unauthorized use, redistribution, or modification for external commercial purposes is prohibited.**

---

## System Impact
Certain modules modify or reset system configurations:
- Windows Firewall states  
- IP/DNS network settings  
- Temporary file cleanup  
- PowerShell execution policies  

Always test modules in a controlled environment before production use.

---

## Logging & Privacy
- Logs are stored locally in `/logs/`
- Logs contain command usage timestamps and targets
- No data is transmitted externally or collected automatically

---

## Security Contacts
- **Internal:** `security@nolabeltech.local`
- **Author:** Brian Lorick  
  _No/Label Security Services & Solutions_
