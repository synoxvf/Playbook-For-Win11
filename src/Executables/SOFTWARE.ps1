param (
    [switch]$Chrome,
    [switch]$Firefox
)

# Install Browser 
if ($Chrome) {
    curl.exe -LSs "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -o "$env:TEMP\ChromeSetup.exe"
	Start-Process -FilePath "$env:TEMP\ChromeSetup.exe" -WindowStyle Hidden -ArgumentList '/silent /install' -Wait
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force
    exit
}

if ($Firefox) {
    curl.exe -LSs "https://download.mozilla.org/?product=firefox-latest&os=win&lang=ru" -o "$env:TEMP\FirefoxSetup.exe"
    Start-Process -FilePath "$env:TEMP\FirefoxSetup.exe" -WindowStyle Hidden -ArgumentList '/S /ALLUSERS=1' -Wait
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force
    exit
}

# Visual C++ runtimes
$vcredists = @(
    @{url="https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.exe"; args="/q"}
    @{url="https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.exe"; args="/q"}
    @{url="https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe"; args="/q"}
    @{url="https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe"; args="/q"}
    @{url="https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe"; args="/q /norestart"}
    @{url="https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe"; args="/q /norestart"}
    @{url="https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe"; args="/install /quiet /norestart"}
    @{url="https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe"; args="/install /quiet /norestart"}
    @{url="https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x86.exe"; args="/install /quiet /norestart"}
    @{url="https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe"; args="/install /quiet /norestart"}
    @{url="https://aka.ms/vs/17/release/vc_redist.x86.exe"; args="/install /quiet /norestart"}
    @{url="https://aka.ms/vs/17/release/vc_redist.x64.exe"; args="/install /quiet /norestart"}
)

foreach ($vcredist in $vcredists) {
    $file = "$env:TEMP" + ($vcredist.url -split '/')[-1]
    try {
        (New-Object System.Net.WebClient).DownloadFile($vcredist.url, $file)
        Start-Process -FilePath $file -ArgumentList $vcredist.args -Wait -WindowStyle Hidden
    } catch {
        Write-Host "Error with $($vcredist.url) : $_"
    }
}

# DirectX runtimes
curl.exe -LSs "https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe" -o "$env:TEMP\DirectX.exe"
Start-Process -FilePath "$env:TEMP\DirectX.exe" -ArgumentList "/Q /C /T:$env:TEMP\DX" -Wait
Start-Process -FilePath "$env:TEMP\DX\DXSETUP.exe" -ArgumentList "/silent" -Wait

Remove-Item -Path "$env:TEMP\*" -Recurse -Force

