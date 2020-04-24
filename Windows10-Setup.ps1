############################
# Personal Preferences on UI
############################

# Change Explorer home screen back to "This PC"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Type DWord -Value 1
# Change it back to "Quick Access" (Windows 10 default)
#Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Type DWord -Value 2

# Disable Quick Access: Recent Files
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowRecent -Type DWord -Value 0
# Disable Quick Access: Frequent Folders
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowFrequent -Type DWord -Value 0
# Disable Start Menu suggestions
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Type DWord -Value 0
# Show known file extensions
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Type DWord -Value 0



############################
# Remap Caps Lock to Windows Key
# https://superuser.com/questions/949385/map-capslock-to-control-in-windows-10
# https://github.com/randyrants/sharpkeys - To get scan codes
# Note: scancodes: 
# 00,3a - Caps
# E0,5B - Super (Left Windows)
# 00,1d - Control
# 00,01 - Esc
# Disable: "Scancode Map"=-
############################
#$hexified = "00,00,00,00,00,00,00,00,02,00,00,00,5B,E0,3A,00,00,00,00,00".Split(',') | % { "0x$_"};
#$kbLayout = 'HKLM:\System\CurrentControlSet\Control\Keyboard Layout';
#New-ItemProperty -Path $kbLayout -Name "Scancode Map" -PropertyType Binary -Value ([byte[]]$hexified);

############################
# Remote Desktop
############################
# Enable Remote Desktop w/o Network Level Authentication
# Write-Host "Enabling Remote Desktop w/o Network Level Authentication..."
# Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Type DWord -Value 0
# Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -Name "UserAuthentication" -Type DWord -Value 0


############################
# Enable Windows Features
############################
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux


# Hyper-V Manager
#Add-WindowsFeature –name RSAT-Hyper-V-Tools
# Hyper-V
#Enable-WindowsOptionalFeature -Online -FeatureName:Microsoft-Hyper-V -All

############################
# Uninstall default bloatware
# Get-AppxPackage -AllUsers | Select Name, PackageFullName
############################
Get-AppxPackage -Name *Twitter* | Remove-AppxPackage
Get-AppxPackage -Name *CandyCrushSodaSaga* | Remove-AppxPackage
Get-AppxPackage -Name *flaregamesGmbH.RoyalRevolt2* | Remove-AppxPackage
Get-AppxPackage -Name *Facebook.Facebook* | Remove-AppxPackage
Get-AppxPackage -Name *BubbleWitch3Saga* | Remove-AppxPackage
Get-AppxPackage -Name *DisneyMagicKingdoms* | Remove-AppxPackage
Get-AppxPackage -Name *MarchofEmpires* | Remove-AppxPackage
Get-AppxPackage -Name *PandoraMediaInc.29680B314EFC2* | Remove-AppxPackage

############################
# Install from Store /// TODO /// 
############################
#"Microsoft.MinecraftUWP"
#"91750D7E.Slack"
#"SpotifyAB.SpotifyMusic"
#"CanonicalGroupLimited.UbuntuonWindows"
# -- Python
# -- Kodi
# -- Windows Terminal

### Manual download
#googlechrome
#steam
#visualstudiocode
#7zip
#git
#sysinternals
#python3
#geforce-game-ready-driver
#wireshark
#openvpn




#--- Rename the Computer ---
# Requires restart, or add the -Restart flag
$computername = "desktop"
if ($env:computername -ne $computername) {
	Rename-Computer -NewName $computername
}

##########
# Restart
##########
Write-Host
Write-Host [...]
Write-Host [...]
Write-Host [...]
Write-Host [...]
Write-Host "Press any key to restart your system..." -ForegroundColor Black -BackgroundColor White
$key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Write-Host "Restarting..."
Restart-Computer