@echo off
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mpssvc" /v Start /t REG_DWORD /d 3 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mpsdrv" /v Start /t REG_DWORD /d 3 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\BFE" /v Start /t REG_DWORD /d 3 /f
exit /b