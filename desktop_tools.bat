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
    goto :start_game
) else (
    goto :bdb
)

:start_game
cls
echo Welcome to tic-tac-toe!
set /p "user1=[PLAYER 1] Username: "
set /p "user2=[PLAYER 2] Username: "

set "winned=no"

set "a1= " & set "a2= " & set "a3= "
set "b1= " & set "b2= " & set "b3= "
set "c1= " & set "c2= " & set "c3= "

:ttt
cls
echo   a  b  c
echo 1[%a1%][%b1%][%c1%]
echo 2[%a2%][%b2%][%c2%]
echo 3[%a3%][%b3%][%c3%]
echo.

set /p "usp1=%user1%, enter cell (like a1 or b2): "
if /i "%usp1%"=="a1" if "%a1%"==" " set "a1=X"
if /i "%usp1%"=="a2" if "%a2%"==" " set "a2=X"
if /i "%usp1%"=="a3" if "%a3%"==" " set "a3=X"
if /i "%usp1%"=="b1" if "%b1%"==" " set "b1=X"
if /i "%usp1%"=="b2" if "%b2%"==" " set "b2=X"
if /i "%usp1%"=="b3" if "%b3%"==" " set "b3=X"
if /i "%usp1%"=="c1" if "%c1%"==" " set "c1=X"
if /i "%usp1%"=="c2" if "%c2%"==" " set "c2=X"
if /i "%usp1%"=="c3" if "%c3%"==" " set "c3=X"

:: WIN SYSTEM (user 1)
if /i "%a1%"=="X" if "%a2%"=="X" if "%a3%"=="X" echo %user1% WIN!
if /i "%b1%"=="X" if "%b2%"=="X" if "%b3%"=="X" echo %user1% WIN!
if /i "%c1%"=="X" if "%c2%"=="X" if "%c3%"=="X" echo %user1% WIN!

if /i "%a1%"=="X" if "%b1%"=="X" if "%c1%"=="X" echo %user1% WIN!
if /i "%a2%"=="X" if "%b2%"=="X" if "%c2%"=="X" echo %user1% WIN!
if /i "%a3%"=="X" if "%b3%"=="X" if "%c3%"=="X" echo %user1% WIN!

if /i "%a3%"=="X" if "%b2%"=="X" if "%c1%"=="X" echo %user1% WIN!
if /i "%a1%"=="X" if "%b2%"=="X" if "%c3%"=="X" echo %user1% WIN!
pause

cls
echo   a  b  c
echo 1[%a1%][%b1%][%c1%]
echo 2[%a2%][%b2%][%c2%]
echo 3[%a3%][%b3%][%c3%]
echo.
echo %user1% make his move

set /p "usp2=%user2%, enter cell (like a1 or b2): "
if /i "%usp2%"=="a1" if "%a1%"==" " set "a1=0"
if /i "%usp2%"=="a2" if "%a2%"==" " set "a2=0"
if /i "%usp2%"=="a3" if "%a3%"==" " set "a3=0"
if /i "%usp2%"=="b1" if "%b1%"==" " set "b1=0"
if /i "%usp2%"=="b2" if "%b2%"==" " set "b2=0"
if /i "%usp2%"=="b3" if "%b3%"==" " set "b3=0"
if /i "%usp2%"=="c1" if "%c1%"==" " set "c1=0"
if /i "%usp2%"=="c2" if "%c2%"==" " set "c2=0"
if /i "%usp2%"=="c3" if "%c3%"==" " set "c3=0"

:: WIN SYSTEM (user 2)
if /i "%a1%"=="0" if "%a2%"=="0" if "%a3%"=="0" echo %user2% WIN!
if /i "%b1%"=="0" if "%b2%"=="0" if "%b3%"=="0" echo %user2% WIN!
if /i "%c1%"=="0" if "%c2%"=="0" if "%c3%"=="0" echo %user2% WIN!

if /i "%a1%"=="0" if "%b1%"=="0" if "%c1%"=="0" echo %user2% WIN!
if /i "%a2%"=="0" if "%b2%"=="0" if "%c2%"=="0" echo %user2% WIN!
if /i "%a3%"=="0" if "%b3%"=="0" if "%c3%"=="0" echo %user2% WIN!

if /i "%a3%"=="0" if "%b2%"=="0" if "%c1%"=="0" echo %user2% WIN!
if /i "%a1%"=="0" if "%b2%"=="0" if "%c3%"=="0" echo %user2% WIN!
pause

goto :ttt
