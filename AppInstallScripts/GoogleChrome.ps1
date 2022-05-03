# Source : Timothy Tibbetts on 04/25/2020
# https://www.majorgeeks.com/content/page/how_to_install_google_chrome_with_powershell.html
# Synopsis : Installs the newest version of chrome available from Google
$LocalTempDir = $env:TEMP; 
$ChromeInstaller = "ChromeInstaller.exe"; 
(new-object System.Net.WebClient).DownloadFile('https://dl.google.com/chrome/install/375.126/chrome_installer.exe', "$LocalTempDir$ChromeInstaller"); 
& "$LocalTempDir$ChromeInstaller" /silent /install; $Process2Monitor = "ChromeInstaller"; 
Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; 
If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } 
else { rm "$LocalTempDir$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound) 
