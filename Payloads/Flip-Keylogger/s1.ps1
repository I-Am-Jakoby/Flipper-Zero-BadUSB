if (![System.IO.Directory]::Exists("$env:appdata\-locker")){New-Item -ItemType Directory -Force -Path "$env:appdata\-locker"};
echo $dc > "$env:appdata\-locker\wh.txt";
