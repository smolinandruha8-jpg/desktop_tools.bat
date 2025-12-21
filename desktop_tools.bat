@echo off
title desktop tools
findstr /C:no properties.txt
if %errorlevel% equ 0 (
chcp 65001
)

set desktop_path=%USERPROFILE%\Desktop
cls

cls
@echo off
echo /=================v2025.0===========(Default)==========================/
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
echo 8.
echo 9.
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
)
if %keycode% equ 5 (
cls
start ""
)
if %keycode% equ 6 (
cls
echo Date: %date%
echo Time: %time%
)
if %keycode% equ 7 (
  for %%f in ("%USERPROFILE%\Desktop\*") do (
    if not "%%~xf"=="" (
        start "" "%%f"
        echo Starting file: %%f
    )
   )
)

if %keycode% equ "vx" (
  cls
  echo ==============================
  echo Script editor - DevTO
  echo ==============================
  echo 
)
pause
