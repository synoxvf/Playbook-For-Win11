@echo off
NET SESSION >nul 2>nul
if %errorlevel% neq 0 (
    set "___args=%~f0 %*"
    powershell -Command "Start-Process -FilePath 'cmd' -ArgumentList '/c %___args%' -Verb RunAs"
    exit /b
)

:: Disable Spectre, Meltdown, Downfall.
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettings /t REG_DWORD /d 1 /f 
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 3 /f 
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f 

:: Disable Structured Exception Handling Overwrite Protection (SEHOP)
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v DisableExceptionChainValidation /t REG_DWORD /d "1" /f 

:: Disable Control Flow Guard (CFG)
PowerShell Set-ProcessMitigation -System -Disable CFG
for /f "tokens=3 skip=2" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationAuditOptions"') do (
    set "mitigation_mask=%%a"
)
for /L %%a in (0,1,9) do (
    set "mitigation_mask=!mitigation_mask:%%a=2!"
) 
reg.exe  add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v MitigationOptions /t REG_BINARY /d "%mitigation_mask%" /f 
reg.exe  add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v MitigationAuditOptions /t REG_BINARY /d "%mitigation_mask%" /f 

:: Disable DEP
bcdedit /set nx OptIn 

:: Disable file system mitigations
reg.exe  add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v ProtectionMode /t REG_DWORD /d 0 /f 

