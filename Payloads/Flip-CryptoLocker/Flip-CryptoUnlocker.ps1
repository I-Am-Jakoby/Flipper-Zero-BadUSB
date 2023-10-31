# Flip-CryptoUnlocker.ps1

function Decrypt-File {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path,
        
        [Parameter(Mandatory=$true)]
        [string]$Password
    )
    
    $AES = New-Object System.Security.Cryptography.AesCryptoServiceProvider
    $AES.IV = New-Object byte[]($AES.IV.Length)
    $AES.Key = [System.Text.Encoding]::UTF8.GetBytes($Password.PadRight($AES.Key.Length, '0'))

    $EncryptedContent = Get-Content -Path $Path -Encoding Byte
    $DecryptedContent = $AES.CreateDecryptor().TransformFinalBlock($EncryptedContent, 0, $EncryptedContent.Length)

    Set-Content -Path $Path -Value $DecryptedContent -Encoding Byte
}

# Fixed password for decryption (it should be the same one used for encryption)
$Password = "D3m0P@ssw0rd"

# Detect the user's documents folder
$DocumentsFolder = [Environment]::GetFolderPath("MyDocuments")

# Get all the files in the documents folder
$Files = Get-ChildItem -Path $DocumentsFolder -File

# Decrypt each file
foreach ($File in $Files) {
    Decrypt-File -Path $File.FullName -Password $Password
    Write-Host "File decrypted: $($File.Name)"
}

Write-Host "All files in the documents folder have been decrypted!"
