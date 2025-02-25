@echo off
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WlanSvc" /v Start /t REG_DWORD /d 3 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\vwififlt" /v Start /t REG_DWORD /d 3 /f
exit /b