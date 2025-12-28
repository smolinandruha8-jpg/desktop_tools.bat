echo off
title desktop tools
findstr /C:no properties.txt
if %errorlevel% equ 0 (
chcp 65001
)

set desktop_path=%USERPROFILE%\Desktop
cls

:bdb
cls
@echo off
echo /=================v2025.6===========(Default)==========================/
echo Welcome to desktop tools
echo Key codes:
echo =======================================================================
echo 1. show all MAYBE virus files (+ if need, delete)
echo 2. create a folder and move it into desktop (pre-name you can change in the script)
echo 3. kill desktop
echo 4. rename the disk C (script need a start from administrator + change text you can ONLY in the script)
echo 5. run ALL files (be careful!)
echo 6. kalendar
echo 7. run all files (with cooldown)
echo 8. make file as shell:startup
echo 10. tic-tac-toe
echo /=======================================================================/
echo vx - credits

:://MAIN//
set /p keycode=Enter your key code...
echo ^G

if %keycode% equ 1 (
start dsd
)
if %keycode% equ 2 (
:: //FOLDER PRE-NAME HERE//
md MyFolder
echo folder created successfully
echo moving folder...
move MyFolder %USERPROFILE%\Desktop\
pause
)
if %keycode% equ 3 (
cls
color a
:x
echo %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random%
goto x
)
if %keycode% equ 4 (
cls
:: //DISK NAME HERE//
label C:sjdasjdka
pause
)
if %keycode% equ 5 (
cls
start ""
)
if %keycode% equ 6 (
cls
echo Date: %date%
echo Time: %time%
pause
)
if %keycode% equ 7 (
  for %%f in ("%USERPROFILE%\Desktop\*") do (
    if not "%%~xf"=="" (
        start "" "%%f"
        echo Starting file: %%f
    )
   )
)
if %keycode% equ 8 (
set /p pt=Enter path to your file
move %pt% %USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
)
if %keycode% equ 10 (
    goto :menu
) else (
    goto :bdb
)

:menu
setlocal enabledelayedexpansion
cls
echo ===============================
echo      TIC-TAC-TOE LAN 
echo ===============================
echo 1. Offline (Local Play)
echo 2. Online (Local Network)
echo 3. Exit
set /p mode="Choose mode (1-3): "

:: Initialize grid
set "a1= " & set "a2= " & set "a3= "
set "b1= " & set "b2= " & set "b3= "
set "c1= " & set "c2= " & set "c3= "

if "%mode%"=="1" goto :offline
if "%mode%"=="2" goto :online_setup
if "%mode%"=="3" exit
goto :menu

:online_setup
cls
echo ONLINE SETUP
echo 1. I am Player X (Starts first)
echo 2. I am Player 0 (Wait for move)
set /p side="Select your side: "
set /p port="Enter Port (e.g., 12345): "
set /p ip="Enter Friend's LOCAL IP: "

if "%side%"=="1" (goto :loopX) else (goto :loop0)

:loopX
cls
call :draw
set /p move="Your move (a1-c3): "
:: Send move without trailing spaces
<nul set /p="%move%" | nc.exe -w 2 %ip% %port%
:: Update locally (X)
call :update %move% X

cls
call :draw
echo Waiting for opponent's move...
if exist temp.txt del temp.txt
nc.exe -l -p %port% > temp.txt
set /p fmove=<temp.txt
call :update %fmove% 0
goto :loopX

:loop0
cls
call :draw
echo Waiting for opponent's move...
if exist temp.txt del temp.txt
nc.exe -l -p %port% > temp.txt
set /p fmove=<temp.txt
call :update %fmove% X

cls
call :draw
set /p move="Your move (a1-c3): "
<nul set /p="%move%" | nc.exe -w 2 %ip% %port%
call :update %move% 0
goto :loop0

:offline
cls
call :draw
set /p move="Player X move: "
call :update %move% X
cls
call :draw
set /p move="Player 0 move: "
call :update %move% 0
goto :offline

:draw
echo.
echo    a   b   c
echo 1 [!a1!] [!b1!] [!c1!]
echo 2 [!a2!] [!b2!] [!c2!]
echo 3 [!a3!] [!b3!] [!c3!]
echo.
exit /b

:update
:: %1 is cell, %2 is symbol (X/0)
if /i "%1"=="a1" set "a1=%2"
if /i "%1"=="a2" set "a2=%2"
if /i "%1"=="a3" set "a3=%2"
if /i "%1"=="b1" set "b1=%2"
if /i "%1"=="b2" set "b2=%2"
if /i "%1"=="b3" set "b3=%2"
if /i "%1"=="c1" set "c1=%2"
if /i "%1"=="c2" set "c2=%2"
if /i "%1"=="c3" set "c3=%2"
exit /b
