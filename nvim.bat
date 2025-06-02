@echo off

REM Add the following folder to the path environment variables
REM %USERPROFILE%\.config

REM Move the folder higher in the PATH to ensure this script is detected before the default nvim.exe

set XDG_CONFIG_HOME=%USERPROFILE%\.config
set XDG_DATA_HOME=%USERPROFILE%\.config
set XDG_STATE_HOME=%USERPROFILE%\.config

nvim.exe %*

REM Update neovim with winget
REM winget install --id=Neovim.Neovim  -e
