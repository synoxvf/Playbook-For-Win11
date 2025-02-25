@echo off
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\bluetoothuserservice" /v Start /t REG_DWORD /d 3 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\btagservice" /v Start /t REG_DWORD /d 3 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\bthserv" /v Start /t REG_DWORD /d 3 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\btha2dp" /v Start /t REG_DWORD /d 3 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\bthenum" /v Start /t REG_DWORD /d 3 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\bthhfenum" /v Start /t REG_DWORD /d 3 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\bthleenum" /v Start /t REG_DWORD /d 3 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\bthmini" /v Start /t REG_DWORD /d 3 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\bthmodem" /v Start /t REG_DWORD /d 3 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\bthport" /v Start /t REG_DWORD /d 3 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\bthusb" /v Start /t REG_DWORD /d 3 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\hidbth" /v Start /t REG_DWORD /d 3 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\microsoft_bluetooth_avrcptransport" /v Start /t REG_DWORD /d 3 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\rfcomm" /v Start /t REG_DWORD /d 3 /f
devmanview /enable "Generic Bluetooth Adapter"
powerrun "schtasks.exe" /change /enable /TN "\Microsoft\Windows\Bluetooth\UninstallDeviceTask" >nul 2>&1
exit /b