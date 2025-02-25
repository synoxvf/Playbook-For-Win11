$shortcut = (New-Object -ComObject WScript.Shell).CreateShortcut((Join-Path ([Environment]::GetFolderPath('Desktop')) "Post-Install.lnk"))
$shortcut.TargetPath = "$env:windir\Post-Install"
$shortcut.Save()

$startupPath = [System.IO.Path]::Combine($env:APPDATA, "Microsoft\Windows\Start Menu\Programs\Startup")
$shortcutName = "XHCI-IMOD-Interval.lnk"
$shortcutPath = Join-Path $startupPath $shortcutName
$command = "%windir%\XHCI-IMOD-Interval.ps1"
$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut($shortcutPath)

$shortcut.TargetPath = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
$shortcut.Arguments = "-NoProfile -ExecutionPolicy Bypass -File `"$command`""
$shortcut.WorkingDirectory = "C:\Windows\System32\WindowsPowerShell\v1.0" 
$shortcut.Save()

$bytes = [System.IO.File]::ReadAllBytes($shortcutPath)
$bytes[0x15] = $bytes[0x15] -bor 0x20
[System.IO.File]::WriteAllBytes($shortcutPath, $bytes)
