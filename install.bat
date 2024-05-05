@ECHO off
CLS
TITLE Basic ADB AND Fastboot Installer by Mihot7
COLOR 09
type logo.txt
ECHO.
ECHO ADB AND FASTBOOT INSTALLER
ECHO MADE BY Mihot7 - 2024
ECHO VERSION 1.0

:Q1
ECHO(
SET /P ANSWER=Do you want to install ADB and Fastboot? (Y/N)
 IF /i {%ANSWER%}=={y} (GOTO ADB_S)
 IF /i {%ANSWER%}=={yes} (GOTO ADB_S)
 IF /i {%ANSWER%}=={n} (GOTO DRV)
 IF /i {%ANSWER%}=={no} (GOTO DRV)
ECHO(
ECHO Use only Y/N or Yes/No
GOTO Q1

:ADB_S
ECHO(
ECHO Installing ADB and Fastboot ...
ECHO(
ADB kill-server > NUL 2>&1
IF EXIST %WINDIR%\adb.exe DEL %WINDIR%\adb.exe /f /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log
IF EXIST %WINDIR%\AdbWinApi.dll DEL %WINDIR%\AdbWinApi.dll /f /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log
IF EXIST %WINDIR%\AdbWinUsbApi.dll DEL %WINDIR%\AdbWinUsbApi.dll /f /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log
IF EXIST %WINDIR%\fastboot.exe DEL %WINDIR%\fastboot.exe /f /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log
XCOPY adb\adb.exe %SYSTEMDRIVE%\adb\ /y /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log 
XCOPY adb\AdbWinApi.dll %SYSTEMDRIVE%\adb\ /y /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log 
XCOPY adb\AdbWinUsbApi.dll %SYSTEMDRIVE%\adb\ /y /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log 
XCOPY adb\fastboot.exe %SYSTEMDRIVE%\adb\ /y /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log
XCOPY adb\updater.bat %SYSTEMDRIVE%\adb\ /y /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log  


:PATH_S
ECHO %PATH% > PATH.TMP
ver > nul
FIND "%SYSTEMDRIVE%\adb" PATH.TMP > nul 2>&1
IF %ERRORLEVEL% LSS 1 GOTO DRV
VER | FIND "5.1" > NUL 2>&1
IF %ERRORLEVEL% LSS 1 xp\SETX.exe PATH "%PATH%;%SYSTEMDRIVE%\adb" /m 2>>%USERPROFILE%\Desktop\adb-installer.log && GOTO DRV
SETX PATH "%PATH%;%SYSTEMDRIVE%\adb" /m 2>>%USERPROFILE%\Desktop\adb-installer.log

:DRV
DEL PATH.TMP
ECHO(
SET /P ANSWER=Do you want to install device drivers? (Y/N)
 IF /i {%ANSWER%}=={y} (GOTO DRIVER)
 IF /i {%ANSWER%}=={yes} (GOTO DRIVER)
 IF /i {%ANSWER%}=={n} (GOTO FINISH)
 IF /i {%ANSWER%}=={no} (GOTO FINISH)
ECHO Use only Y/N or Yes/No
GOTO DRV

:DRIVER
IF DEFINED programfiles(x86) GOTO x64

:x86
ECHO(
ECHO Installing 32-bit driver ...
ECHO Please complete driver installation ...
PING localhost -n 1 >NUL
START /wait driver\DPInst_x86 /f 2>>%USERPROFILE%\Desktop\adb-installer.log
GOTO FINISH

:x64
ECHO(
ECHO Installing 64-bit driver ...
ECHO Please complete driver installation ...
PING localhost -n 1 >NUL
START /wait driver\DPInst_x64 /f 2>>%USERPROFILE%\Desktop\adb-installer.log

:FINISH
ECHO(
ECHO Everything is ready!
GOTO LOG_SEE

:LOG_SEE
ECHO(
SET /P ANSWER=Do you want to see log? (Y/N)
 IF /i {%ANSWER%}=={y} (GOTO LOG_SEE2)
 IF /i {%ANSWER%}=={yes} (GOTO LOG_SEE2)
 IF /i {%ANSWER%}=={n} (GOTO EXIT)
 IF /i {%ANSWER%}=={no} (GOTO EXIT)
ECHO Use only Y/N or Yes/No
GOTO LOG_SEE

:LOG_SEE2
TYPE %USERPROFILE%\Desktop\adb-installer.log
pause
DEL %USERPROFILE%\Desktop\adb-installer.log /Q>NUL
goto exit

:EXIT
IF %~z1 == 0 DEL %USERPROFILE%\Desktop\adb-installer.log /f /q > nul 2>&1
TIMEOUT /T 3 /NOBREAK>NUL
EXIT