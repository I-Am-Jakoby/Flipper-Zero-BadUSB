############################################################################################################################################################                      
#                                  |  ___                           _           _              _             #              ,d88b.d88b                     #                                 
# Title        : PS-CustomDraw     | |_ _|   __ _   _ __ ___       | |   __ _  | | __   ___   | |__    _   _ #              88888888888                    #           
# Author       : I am Jakoby       |  | |   / _` | | '_ ` _ \   _  | |  / _` | | |/ /  / _ \  | '_ \  | | | |#              `Y8888888Y'                    #           
# Version      : 1.0               |  | |  | (_| | | | | | | | | |_| | | (_| | |   <  | (_) | | |_) | | |_| |#               `Y888Y'                       #
# Category     : Prank             | |___|  \__,_| |_| |_| |_|  \___/   \__,_| |_|\_\  \___/  |_.__/   \__, |#                 `Y'                         #
# Target       : Windows 7,10,11   |                                                                   |___/ #           /\/|_      __/\\                  #     
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
.NOTES
	This script uses the provided arrays to generate images. You also have the ability to make your own if you so choose. 
	To increase the size of the pixels add more spaces to the following Write-Host command.
	Write-Host "  " -NoNewline -BackgroundColor $Colors[$position] 

.DESCRIPTION 
	This program will take the provided arrays and use them to generate images that will be drawn out in a powershell window. 

.SYNTAX 
	$col  | PS-Draw
	$hak5 | PS-Draw
	$omg  | PS-Draw
	PS-Draw -Image $col
	PS-Draw -Image $hak5
	PS-Draw -Image $omg
#>
############################################################################################################################################################

$Colors = @{
    1         =   'White'               
    2         =   'Black'         
    3         =   'DarkBlue'    
    4         =   'DarkGreen'     
    5         =   'DarkCyan'      
    6         =   'DarkRed'       
    7         =   'DarkMagenta'   
    8         =   'DarkYellow'    
    9         =   'Gray'          
    10        =   'DarkGray'      
    11        =   'Blue'          
    12        =   'Green'         
    13        =   'Cyan'          
    14        =   'Red'           
    15        =   'Magenta'       
    16        =   'Yellow'         
}

		#Show available colors
$col   =  @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1), 
          @(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),
          @(3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3),
          @(4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4),
          @(5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5),
          @(6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6),
          @(7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7),
          @(8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8),
          @(9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9),
          @(10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10),
          @(11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11),
          @(12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12),
          @(13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13),
          @(14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14),
          @(15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15),
          @(16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16)


$omg  =   @(2,2,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1), 
          @(2,2,2,1,1,1,1,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2),
          @(2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,1,1,1,2,2,2),
          @(2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,1,1,1,2,2,2),
          @(2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,1,1,1,2,2,2),
          @(2,2,2,2,1,1,1,1,2,2,2,2,2,2,2,2,1,1,1,1,2,2),
          @(2,2,2,1,1,1,1,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2),
          @(2,2,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1),
          @(2,2,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1),
          @(2,2,1,1,1,1,2,2,2,1,1,1,1,1,1,2,2,2,1,1,1,1),
          @(2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
          @(2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
          @(2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2),
          @(2,2,2,2,1,1,1,1,1,1,2,2,2,2,1,1,1,1,1,1,2,2),
          @(2,2,2,2,1,1,1,1,1,2,2,2,2,2,2,1,1,1,1,1,2,2),
          @(2,2,2,2,1,1,1,1,2,2,2,2,2,2,2,2,1,1,1,1,2,2),
          @(2,2,2,2,1,1,1,1,2,2,2,2,2,2,2,2,1,1,1,1,2,2),
          @(2,2,2,2,1,1,1,1,2,2,2,2,2,2,2,2,1,1,1,1,2,2),
          @(2,2,2,2,1,1,1,1,2,2,2,2,2,2,2,2,1,1,1,1,2,2),
          @(2,2,2,2,1,1,1,1,1,2,2,2,2,2,2,1,1,1,1,1,2,2),
          @(2,2,2,2,1,1,1,1,1,1,2,2,2,2,1,1,1,1,1,1,2,2),
          @(2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2),
          @(2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2),
          @(2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2),
          @(2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,2,2,2,2,2,2,2)


$hak5  =  @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1), 
          @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
          @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
          @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,6,6,6,6,6,6,6,6,6,1),
          @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,6,6,6,6,6,6,6,6,6,6,1),
          @(1,1,1,1,1,1,1,1,1,1,1,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,6,6,6,6,1,1,1,1,1,1,1),
          @(1,2,2,1,1,1,1,1,1,1,1,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,6,6,6,6,1,1,1,1,1,1,1),
          @(1,2,2,1,1,1,1,1,1,1,1,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,6,6,6,6,6,6,6,6,6,6,6,1),
          @(1,2,2,1,1,1,1,1,1,1,1,2,2,1,1,1,1,2,2,2,1,1,1,2,2,1,1,1,2,2,1,6,6,6,6,6,6,6,6,6,6,6,1),
          @(1,2,2,1,1,1,1,1,1,1,1,2,2,1,1,1,1,2,2,2,1,1,1,2,2,1,1,2,2,1,1,6,6,6,6,1,1,1,6,6,6,6,1),
          @(1,2,2,1,1,1,1,1,1,1,1,2,2,1,1,1,2,2,2,2,1,1,1,2,2,2,2,2,1,1,1,6,6,6,1,1,1,1,6,6,6,6,1),
          @(1,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,1,1,2,2,1,1,2,2,2,2,2,1,1,1,1,1,1,1,1,1,6,6,6,6,6,1),
          @(1,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,1,1,1,1,1,1,6,6,6,6,6,1),
          @(1,2,2,1,1,1,1,1,1,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,1,1,1,1,1,1,6,6,6,6,6,1),
          @(1,2,2,1,1,1,1,1,1,1,1,2,2,1,1,2,2,2,2,2,2,2,1,2,2,1,1,1,2,6,6,6,6,6,1,1,6,6,6,6,6,1,1),
          @(1,2,2,1,1,1,1,1,1,1,1,2,2,1,1,2,2,2,2,2,2,2,1,2,2,1,1,1,1,6,6,6,6,6,1,1,6,6,6,6,6,1,1),
          @(1,2,2,1,1,1,1,1,1,1,1,2,2,2,2,2,1,1,1,1,2,2,2,2,2,1,1,1,1,6,6,6,6,6,1,1,6,6,6,6,1,1,1),
          @(1,2,2,1,1,1,1,1,1,1,1,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,6,6,6,6,6,6,6,6,6,6,6,1,1,1),
          @(1,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,6,6,6,6,6,6,6,6,6,6,1,1,1,1),
          @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,6,6,6,6,6,6,6,1,1,1,1,1,1,1),
          @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

# -------------------------------------------------------------------------------------------		


function PS-Draw { 
    [CmdletBinding()]
    param ( 
        [Parameter (Mandatory = $True, ValueFromPipeline = $True)]
        [Alias("I")]
        [object[]]$Image
    )

    # if the data is sent through the pipeline, use $input to collect is as array
    if ($PSCmdlet.MyInvocation.ExpectingInput) { $Image = @($input) }
    #$Data | Out-String -Stream -Width 9999 | ForEach-Object { "$($_.Trim())`r`n" }

    cls
   
    foreach ($row in $Image) {
      foreach ($position in $row) {
        Write-Host "  " -NoNewline -BackgroundColor $Colors[$position]
        Start-Sleep -m 10
      }
      Write-Host ""
    }
}

<#

.NOTES 
	This will get either the targets full name associated with the registered microsoft account 
	or it will default to grabbing the username of the account to use as a greeting for this script
#>

 function Get-fullName {

    try {

    $fullName = Net User $Env:username | Select-String -Pattern "Full Name";$fullName = ("$fullName").TrimStart("Full Name")

    }
 
 # If no name is detected function will return $env:UserName 

    # Write Error is just for troubleshooting 
    catch {Write-Error "No name was detected" 
    return $env:UserName
    -ErrorAction SilentlyContinue
    }

    return $fullName 

}

# -------------------------------------------------------------------------------------------

# Get name to be used in greeting

cls

$fullName = Get-fullName

echo "Hello $fullName"

# -------------------------------------------------------------------------------------------

<#

.NOTES 
	Then the script will be paused until the mouse is moved 
	script will check mouse position every indicated number of seconds
	This while loop will constantly check if the mouse has been moved 
	"CAPSLOCK" will be continuously pressed to prevent screen from turning off
	it will then sleep for the indicated number of seconds and check again
	when mouse is moved it will break out of the loop and continue the script
#>


Add-Type -AssemblyName System.Windows.Forms
$o=New-Object -ComObject WScript.Shell
$originalPOS = [System.Windows.Forms.Cursor]::Position.X

    while (1) {
        $pauseTime = 3
        if ([Windows.Forms.Cursor]::Position.X -ne $originalPOS){
            break
        }
        else {
            $o.SendKeys("{CAPSLOCK}");Start-Sleep -Seconds $pauseTime
        }
    }

<#

.NOTES 
	This is where you call the function to draw out one of the images above 
	$col  - to see the available colors you can use for a custom image 
	$hak5 - this will draw out the hak5 five logo
	$omg  - this will draw out the omg logo 
#>

# -------------------------------------------------------------------------------------------

# Call function with one of the arrays listed above to generate an image

$hak5 | PS-Draw


