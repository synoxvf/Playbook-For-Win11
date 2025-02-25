@echo off
NET SESSION >nul 2>nul
if %errorlevel% neq 0 (
    set "___args=%~f0 %*"
    powershell -Command "Start-Process -FilePath 'cmd' -ArgumentList '/c %___args%' -Verb RunAs"
    exit /b
)

:: Disable Memory Integrity
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /t REG_DWORD /d 0 /f

:: Disable Kernel-mode Hardware-enforced Stack Protection
reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\KernelShadowStacks" /v Enabled /t REG_DWORD /d 0 /f
reg.exe delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\KernelShadowStacks" /v WasEnabledBy /f

:: Disable VBS
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v EnableVirtualizationBasedSecurity /t REG_DWORD /d 0 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v RequirePlatformSecurityFeatures /t REG_DWORD /d 0 /f