if((get-date) -gt (Get-content "$env:appdata\-locker\killswitch.txt")){
Remove-Item "$env:appdata\-locker" -Recurse -Force;
Remove-Item "$env:userprofile\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\-p.cmd"
Remove-Item "$env:appdata\-exit.ps1"
}
else{continue}
