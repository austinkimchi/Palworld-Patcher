## Palworld Patcher
Palworld Patcher is a tool that migrates a co-op world to a dedicated server.
The purpose of this tool is to help migrate the UID change of the host (i.e ...000001) to the new-UID of the server.

### Prerequisites
1. [Python 3.9 or later](https://www.python.org/downloads/)
    - This patcher uses `palworld-save-tools` package
      ```bash
      python -m pip install palworld-save-tools
      ```
        or
      ```bash
      pip install palworld-save-tools
      ```
3. [Java 8 or later (JRE)](https://www.java.com/en/download/manual.jsp)
    - This patcher uses `PalParser.jar`
    - For Windows users, `choco install jre8`
    - For Mac users, `brew install --cask adoptopenjdk8`
    - For Linux users, `sudo apt install default-jre`
4. Bash Shell
    - For Windows users, it is recommended to use [Git Bash](https://git-scm.com/downloads)
    - For Mac users, the default terminal will do
    - For Linux users, any bash terminal will do
5. Palworld Server Installation

### Installation
0. Run the server and NO ONE joins the game
    - This will create the `GameUserSettings.ini` if not already created
    - Stop Server
1. Change the `DedicatedServerName` parameter to your transfer file
    - Find the `GameUserSettings.ini` located in `PalServer/Pal/Saved/Config/[OS]Server`
    - Replace `DedicatedServerName` parameter to your transfer file's game name from path `.../SaveGames/0/[THIS RANDOM CHARACTERS]`
2. Run the server and ONLY HOST joins the game
    - This will create the `[HOST].sav` file in the `Players` folder
    - Note, the \[HOST\] is the new-UID of the host
    - Stop Server

3. Clone this repository
    ```bash
    git clone https://github.com/PrincessKimchi/Palworld-Patcher.git
    ```
    https://www.virustotal.com/gui/file/f31fbb56df17f5d33bbb0e5585ef7581b66bfe8969bef04b7c7d2935368610e8 <br />
    https://www.virustotal.com/gui/file/1c06e4fc8f03cc02e6cee9eed8827f1a156e72c1d154e05ac1a4f3421bcdbb18 <br />
   Always check MD5 of files and virus scan yourself to ensure you aren't downloading malware.
   

5. Install the required packages
    ```bash
    python -m pip install palworld-save-tools
    ```
    Double check that the package is installed by running
    ```bash
    palworld-save-tools -h
    ```
> [!IMPORTANT]
> If the installation failed, run terminal as an administrator or use `sudo` for Linux and Mac users. <br />Remember to add python installation path to your enviromental variables.  <br /> This step is crucial for the `PalPatcher.sh` to work properly.
<br />


5. Drag the `.sav` file into the same patcher directory (Host.sav or Level.sav)
```
.
├── PalPatcher.sh
├── PalParser.jar
└── Level.sav or ...00000001.sav
```

> [!NOTE]
> You only need to run this script with `00000000000000000000000000000001.sav` or `Level.sav` files. <br />  For other players, drag them into the player folder without any modifications.
<br />

6. Run `PalPatcher.sh` script in bash terminal
    ```bash
    bash PalPatcher.sh
    ```
    It will asks for some paramters. Fill them accordingly.
   
> [!NOTE]
> OldUID - usually `00000000000000000000000000000001` <br />
> NewUID - find this by logging in to the game and a new file with UID will be created <br />
> File Location - If in the same directory, `Level.sav` or `HOST.sav` file 
<br />


7. The process is all automated and will take a few seconds to complete
    After complete, the `Level.sav` or `HOST.sav` file will be updated.

8. Drag the `Level.sav` or `HOST.sav` file to the `SaveGames/0/{RANDOMCHARS}` folder
    - Replace the old file with the new file

9. Run the server and all players can join the game

> [!IMPORTANT]
> Both the `Host.sav` and `Level.sav` files must be updated for the patch to work correctly. Do them one at a time.
