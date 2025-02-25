@echo off
taskkill /f /im OneDrive.exe

%Systemroot%\System32\OneDriveSetup.exe /uninstall
%Systemroot%\SysWOW64\OneDriveSetup.exe /uninstall

rd "%UserProfile%\OneDrive" /s /q
rd "%LocalAppData%\Microsoft\OneDrive" /s /q
rd "%ProgramData%\Microsoft OneDrive" /s /q
rd "%Systemdrive%\OneDriveTemp" /s /q
del "%UserProfile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk" /s /f /q

reg delete "HKEY_USERS\Default\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "OneDriveSetup" /f

reg delete "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
reg delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
reg add "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v "System.IsPinnedToNameSpaceTree" /d "0" /t REG_DWORD /f

del /f /q "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /s /f /q
del /f /q "%SystemRoot%\System32\OneDriveSetup.exe" /s /f /q
