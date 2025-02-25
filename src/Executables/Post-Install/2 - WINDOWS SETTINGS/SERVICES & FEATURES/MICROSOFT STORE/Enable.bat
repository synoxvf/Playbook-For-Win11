@echo off
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC" /v Start /t REG_DWORD /d 2 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LicenseManager" /v Start /t REG_DWORD /d 2 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /t REG_DWORD /d 2 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\dosvc" /v Start /t REG_DWORD /d 2 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v Start /t REG_DWORD /d 2 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc" /v Start /t REG_DWORD /d 2 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\BITS" /v Start /t REG_DWORD /d 2 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\InstallService" /v Start /t REG_DWORD /d 2 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\BFE" /v Start /t REG_DWORD /d 2 /f
exit /b