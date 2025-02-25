@echo off
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Spooler" /v Start /t REG_DWORD /d 3 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\PrintWorkFlowUserSvc" /v Start /t REG_DWORD /d 3 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\StiSvc" /v Start /t REG_DWORD /d 3 /f
exit /b
