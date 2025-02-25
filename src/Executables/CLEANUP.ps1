
$keys = @(
    "Active Setup Temp Folders", "BranchCache", "D3D Shader Cache", "Delivery Optimization Files", 
    "Downloaded Program Files", "Internet Cache Files", "Old ChkDsk Files", "Recycle Bin", 
    "Setup Log Files", "System error memory dump files", "System error minidump files", 
    "Temporary Files", "Thumbnail Cache", "Update Cleanup", "User file versions", 
    "Windows Error Reporting Files"
)

foreach ($key in $keys) {
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\$key" `
        /v "StateFlags0050" /t REG_DWORD /d 2 /f
}

Start-Process -FilePath "$env:SystemRoot\system32\cleanmgr.exe" -ArgumentList "/sagerun:1337" -Wait:$false

# Cleaning up Event Logs
Get-EventLog -LogName * | ForEach-Object { Clear-EventLog $_.Log }

# Cleaning up leftovers
Stop-Service -Name "bits" -Force | Out-Null
Stop-Service -Name "appidsvc" -Force | Out-Null
Stop-Service -Name "dps" -Force | Out-Null
Stop-Service -Name "wuauserv" -Force | Out-Null
Stop-Service -Name "cryptsvc" -Force | Out-Null

Remove-Item -Path "$env:TEMP" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:USERPROFILE\AppData\Local\Temp" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:USERPROFILE\AppData\Roaming\Temp" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:SystemDrive\Windows.old" -Recurse -Force -ErrorAction SilentlyContinue

$folders = @(
    "CbsTemp",
    "Logs",
    "SoftwareDistribution",
    "System32\LogFiles",
    "System32\LogFiles\WMI,"
    "System32\SleepStudy",
    "System32\sru",
    "System32\WDI\LogFiles",
    "System32\winevt\Logs",
    "catroot2",
    "SystemTemp",
    "Temp"
)

foreach ($folder in $folders) {
    $folderPath = Join-Path $env:SystemRoot $folder
    if (Test-Path $folderPath) {
        Remove-Item -Path "$folder\*" -Force -Recurse
    }
}
