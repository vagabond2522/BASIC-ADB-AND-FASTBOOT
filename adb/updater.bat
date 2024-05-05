@echo off
Title BASIC ADB AND FASTBOOT UPDATER
:note1
echo Hi! This Updater was created on 05.05.2024 and it's not updated very often.
echo So, please check my github to check if I updated ADB version on the update repo.
echo If I slept trough some updates of ADB please pull request or create an issue.
echo Thanks for installing Basic ADB and FASTBOOT!
echo Mihot7 2024
pause
cls

:note2
echo If this doesn't work please verify that you have curl installed.
echo NOTE: Modern Windows 10/11 (Maybe 12 when it will be made.) installs have curl preinstalled.
echo If you're using an old vesrion of Windows 10/11 or Something older than Windows 10 THIS WILL NOT WORK!
pause
cls

:Internet_check
echo Checking your internet connection...
ping www.google.com -n 1 -w 1000>nul
if errorlevel 1 (
    goto no_internet
) else (
    echo Connected to the internet && goto update
)

:no_internet
echo Cannot continue - No internet connection.
echo Press any key to exit.
pause>nul
exit

:update
echo Ok, lets update your android tools!
echo The updater will use this server:
echo https://raw.githubusercontent.com/Mihot7/BAAF-UPDATE-SERVER/main/
echo Updating...
del *.exe /q
curl https://raw.githubusercontent.com/Mihot7/BAAF-UPDATE-SERVER/main/adb.exe --silent --output adb.exe
curl https://raw.githubusercontent.com/Mihot7/BAAF-UPDATE-SERVER/main/fastboot.exe --silent --output fastboot.exe
curl https://raw.githubusercontent.com/Mihot7/BAAF-UPDATE-SERVER/main/AdbWinUsbApi.dll --silent --output AdbWinUsbApi.dll
curl https://raw.githubusercontent.com/Mihot7/BAAF-UPDATE-SERVER/main/AdbWinApi.dll --silent --output AdbWinApi.dll
CLS
ECHO DONE.
pause
exit

