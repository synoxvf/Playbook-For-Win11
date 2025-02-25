@echo off
:: Enable Windows Defender
reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows Defender\Spynet" /v SpyNetReporting /f
reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /f
reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /f
reg.exe delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableScanOnRealtimeEnable /f
reg.exe delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /f
reg.exe delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v EnableWebContentEvaluation /f
reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v SecurityHealth /f
reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v WindowsDefender /f
reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /f
reg.exe delete "HKLM\SOFTWARE\Policies\Microsoft\Microsoft Antimalware\Real-Time Protection" /v DisableScanOnRealtimeEnable /f
reg.exe delete "HKLM\SOFTWARE\Policies\Microsoft\Microsoft Antimalware\Real-Time Protection" /v DisableOnAccessProtection /f
reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\CI\Policy" /v VerifiedAndReputablePolicyState /f
reg.exe delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /f
reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WTDS\Components" /v ServiceEnabled /f
reg.exe delete "HKCU\SOFTWARE\Microsoft\Edge" /v SmartScreenEnabled /f
:: Enable Services
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Sense" /v Start /t REG_DWORD /d 2 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\wscsvc" /v Start /t REG_DWORD /d 2 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc" /v Start /t REG_DWORD /d 2 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v Start /t REG_DWORD /d 2 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MsSecCore" /v Start /t REG_DWORD /d 2 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WdBoot" /v Start /t REG_DWORD /d 2 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisDrv" /v Start /t REG_DWORD /d 2 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v Start /t REG_DWORD /d 2 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WdFilter" /v Start /t REG_DWORD /d 2 /f
