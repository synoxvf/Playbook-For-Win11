@echo off
:: Enable Spectre and Meltdown
reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettings /f > nul
reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /f > nul
reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /f > nul

:: Enable Structured Exception Handling Overwrite Protection (SEHOP)
reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableExceptionChainValidation" /f > nul 2>&1

:: Set default mitigations
reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationAuditOptions" /f > nul 2>&1
reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationOptions" /f > nul 2>&1

:: Enable DEP
bcdedit /set nx OptIn > nul

:: Enable file system mitigations
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "ProtectionMode" /t REG_DWORD /d "1" /f > nul

