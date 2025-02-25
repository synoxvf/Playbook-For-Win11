@echo off
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Spooler" /v Start /t REG_DWORD /d 4 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\PrintWorkFlowUserSvc" /v Start /t REG_DWORD /d 4 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\StiSvc" /v Start /t REG_DWORD /d 4 /f
exit /b

