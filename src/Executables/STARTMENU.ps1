
Copy-Item -Path "Layout.xml" -Destination "$env:SYSTEMDRIVE\Windows\StartMenuLayout.xml" -Force

Get-ChildItem -Path "HKU:\" | Where-Object { $_.PSChildName -match "^S-.*|AME_UserHive_" } | ForEach-Object {
    $user = $_.PSChildName
    $volEnv = Get-ItemProperty -Path "HKU\$user" -Name "Volatile Environment" -ErrorAction SilentlyContinue
    if ($volEnv) {
        $localAppData = (Get-ItemProperty -Path "HKU\$user\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" -Name "Local AppData")."Local AppData"
        Copy-Item -Path "LayoutUser.xml" -Destination "$localAppData\Microsoft\Windows\Shell\LayoutModification.xml" -Force
        Set-ItemProperty -Path "HKU\$user\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "LockedStartLayout" -Value 0 -Force
        Set-ItemProperty -Path "HKU\$user\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "StartLayoutFile" -Value "C:\Windows\StartMenuLayout.xml" -Force
        Get-ChildItem -Path "HKU\$user\SOFTWARE\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount" | 
        Where-Object { $_.Name -match "start.tilegrid" } | 
        Remove-Item -Force
    }
}

Invoke-Expression "PowerShell -NoP -C Import-StartLayout -LayoutPath '$env:SYSTEMDRIVE\Windows\StartMenuLayout.xml' -MountPath $env:SystemDrive"

Set-ItemProperty -Path "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "StartLayoutFile" -Value "$env:SYSTEMDRIVE\Windows\StartMenuLayout.xml" -Force
