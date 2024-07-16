### Prerequisites
1. Python 3.9 or later
    - This patcher uses `palworld-save-tools` package
2. Java 8 or later (JRE)
    - This patcher uses `PalParser.jar`
    - For Windows users, `choco install jre8`
    - For Mac users, `brew install --cask adoptopenjdk8`
    - For Linux users, `sudo apt install default-jre`
3. Bash Shell
    - For Windows users, it is recommended to use Git Bash
    - For Mac users, the default terminal will do
    - For Linux users, any bash terminal will do
4. Palworld Server Installation

### Installation
0. Run the server and NO ONE joins the game
    - This will create the `GameUserSettings.ini` if not already existed
    - Stop Server
1. Change the `DedicatedServerName` parameter to your transfer file
    - Find the `GameUserSettings.ini` located in `PalServer/Pal/Saved/Config/[OS]Server`
    - Replace `DedicatedServerName` parameter to your transfer file's game name from path `.../SaveGames/0/[THIS RANDOM CHARACTERS]`
2. Run the server and ONLY HOST joins the game
    - This will create the `[HOST].sav` file in the `Players` folder
    - Note, the \[HOST\] is the UID of the host
    - Stop Server

3. Clone this repository
    ```bash
    git clone https://github.com/PrincessKimchi/Palworld-Patcher.git
    ```

4. Install the required packages
    ```bash
    python -m pip install palworld-save-tools
    ```
    Double check that the package is installed by running
    ```bash
    palworld-save-tools -h
    ```
    > [!IMPORTANT]
    > If the installation failed it will display run terminal as an administrator or use `sudo` for Linux and Mac users

5. Drag the `.sav` file into the same patcher directory (Host.sav or Level.sav)
```
.
├── PalParser.sh
├── PalParser.jar
└── Level.sav
```
> [!NOTE]
> You only need to run this script with `00000000000000000000000000000001.sav` and `Level.sav` files. The other players, drag them into the player folder without any modifications.


6. Run `PalParser.sh` script in bash terminal
    ```bash
    bash PalParser.sh
    ```
    It will asks for some paramters. Fill them accordingly.
    > [!NOTE] Running the HOST sav
    > OldUID - usually `00000000000000000000000000000001`
    > NewUID - find this by logging in to the game and a new file with UID will be created
    > File Location - At same directory just put `Level.sav` or `HOST.sav` file

7. The process is all automated and will take a few seconds to complete
    After complete, the `Level.sav` or `HOST.sav` file will be updated.

8. Drag the `Level.sav` or `HOST.sav` file to the `SaveGames/0/DSN` folder
    - Replace the old file with the new file

9. Run the server and all players can join the game

> [!IMPORTANT]
> Both the `Host.sav` and `Level.sav` files must be updated for the patch to work correctly. Do them one at a time.
