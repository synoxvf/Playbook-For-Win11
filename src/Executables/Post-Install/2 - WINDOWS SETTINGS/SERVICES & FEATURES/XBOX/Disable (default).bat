@echo Off
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\xblauthmanager" /v Start /t REG_DWORD /d 4 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\xblgamesave" /v Start /t REG_DWORD /d 4 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\xboxgipsvc" /v Start /t REG_DWORD /d 4 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\xboxnetapisvc" /v Start /t REG_DWORD /d 4 /f
exit /b
