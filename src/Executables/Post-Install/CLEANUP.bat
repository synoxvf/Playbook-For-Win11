@echo off
cleanmgr /sageset:50 & cleanmgr /sagerun:50  >nul 2>&1

:: Clear Temp
del /s /f /q "%temp%" 
del /s /f /q "%Windir%\Temp" 
del /s /f /q "%Windir%\Prefetch" 

:: Clear Log
del /s /f /q %systemdrive%\*.tmp 
del /s /f /q %systemdrive%\*._mp 
del /s /f /q %systemdrive%\*.log 
del /s /f /q %systemdrive%\*.gid 
del /s /f /q %systemdrive%\*.chk 
del /s /f /q %systemdrive%\*.old 
del /s /f /q %systemdrive%\recycled\*.* 
del /s /f /q %systemdrive%\$Recycle.Bin\*.* 
del /s /f /q %windir%\*.bak 
del /s /f /q %windir%\prefetch\*.* 
del /s /f /q %LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db 
del /s /f /q %LocalAppData%\Microsoft\Windows\Explorer\*.db 
del /f /q %SystemRoot%\Logs\CBS\CBS.log 
del /f /q %SystemRoot%\Logs\DISM\DISM.log 

:: NVIDIA Shader Cach
del /s /f /q "%LocalAppData%\NVIDIA\GLCache" 
del /s /f /q "%LocalAppData%\NVIDIA\DXCache" 
del /s /f /q "%ProgramData%\NVIDIA Corporation\NV_Cache" 
del /s /f /q "%UserProfile%\AppData\LocalLow\NVIDIA\PerDriverVersion\DXCache" 
del /s /f /q "%UserProfile%\AppData\Roaming\NVIDIA\ComputeCache" 

:: AMD Shader Cache
del /s /f /q "%LocalAppData%\AMD\DX9Cache" 
del /s /f /q "%Local%\AMD\DxCache" 
del /s /f /q "%UserProfile%\AppData\LocalLow\AMD\DxCache" 
del /s /f /q "%LocalAppData%\AMD\DxcCache" 
del /s /f /q "%LocalAppData%\AMD\OglCache" 
del /s /f /q "%LocalAppData%\AMD\GLCache" 
del /s /f /q "%LocalAppData%\AMD\VkCache" 
del /s /f /q "%LocalAppData%\VulkanCache" 
del /s /f /q "%LocalAppData%\ATI\ACE\Cache" 

:: Intel Shader Cache...
del /s /f /q "%LocalAppData%\Intel\ShaderCache" 
del /s /f /q "%ProgramData%\Intel\ShaderCache" 
del /s /f /q "%LocalAppData%\Intel\Graphics\ShaderCache" 
del /s /f /q "%AppData%\Intel\ShaderCache" 

:: Other Shader Cache
del /s /f /q "%LocalAppData%\D3DSCache" 
del /s /f /q "%LocalAppData%\setup\cache\qmlcache" 

:: Clear Windows Update Files
net stop wuauserv
net stop UsoSvc
net stop bits
rd /s /q "%Windir%\SoftwareDistribution" 
md "%Windir%\SoftwareDistribution"

:: Clear Windows Error Reporting cache
del /s /f /q "%ProgramData%\Microsoft\Windows\WER\" 