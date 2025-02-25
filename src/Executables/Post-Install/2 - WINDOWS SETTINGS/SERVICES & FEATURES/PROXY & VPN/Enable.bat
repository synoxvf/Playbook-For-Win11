@echo off
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WinHttpAutoProxySvc" /v Start /t REG_DWORD /d 2 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\RasMan" /v Start /t REG_DWORD /d 2 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\SstpSvc" /v Start /t REG_DWORD /d 2 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\PolicyAgent" /v Start /t REG_DWORD /d 3 /f
exit /b