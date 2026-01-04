echo off
setlocal enabledelayedexpansion
title desktop tools
findstr /C:no properties.txt
if %errorlevel% equ 0 (
chcp 65001>nul
)

if not exist abc.txt (
goto :register
) else (
goto :login
)

set desktop_path=%USERPROFILE%\Desktop
cls

:bdb
cls
@echo off
echo "________                 __      __                  ___________           .__          "
echo "\______ \   ____   _____|  | ___/  |_  ____ ______   \__    ___/___   ____ |  |   ______"
echo " |    |  \_/ __ \ /  ___/  |/ /\   __\/  _ \\____ \    |    | /  _ \ /  _ \|  |  /  ___/"
echo " |    `   \  ___/ \___ \|    <  |  | (  <_> )  |_> >   |    |(  <_> |  <_> )  |__\___ \ "
echo "/_______  /\___  >____  >__|_ \ |__|  \____/|   __/    |____| \____/ \____/|____/____  >"
echo "        \/     \/     \/     \/             |__|                                     \/"
echo /=================v2026.4===========(Default)==========================/
echo Welcome to desktop tools
echo Key codes:
echo =======================================================================
echo [1]. show all MAYBE virus files (+ if need, delete)
echo [2]. create a folder and move it into desktop (pre-name you can change in the script)
echo [3]. kill desktop
echo [4]. rename the disk C (script need a start from administrator + change text you can ONLY in the script)
echo [5]. run ALL files (be careful!)
echo [6]. kalendar
echo [7]. run all files (with cooldown)
echo [10]. tic-tac-toe
echo /=======================================================================/
echo [11]. mod special

:://MAIN//
set /p keycode=Enter your key code...
echo ^G

if %keycode% equ 11 (
goto :mod
)
if %keycode% equ 1 (
dir /b %userprofile%\AppData\Local\Temp

set /p delCode=Type 1 for delete files, or type 2 to continue...
if !delCode! equ 1 (
cls
RMDIR /S /Q %userprofile%\AppData\Local\Temp
echo Files deleted
)
pause
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
cls
set /p port="Enter Port (e.g., 12345): "
cls
if not exist last_ip.txt (
    set /p ip="Enter Friend's LOCAL IP: "
    Echo !ip!>last_ip.txt
) else (
    echo do you want to use last IP? 1 - yes, 2 - no
    set /p wow="Enter 1 or 2... "
    
    if "!wow!"=="1" (
        for /f "usebackq delims=" %%i in ("last_ip.txt") do (
            set ip=%%i
        )
    ) else (
        set /p ip="Enter Friend's LOCAL IP: "
        Echo !ip!>last_ip.txt
    )
)

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
echo    a    b    c
echo 1 I!a1!I  I!b1!I  I!c1!I
echo --------+------+------
echo 2 I!a2!I  I!b2!I  I!c2!I
echo --------+------+------
echo 3 I!a3!I  I!b3!I  I!c3!I
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

:register
cls
echo Please enter your new password and confirm it for your security and protection from attacks.
set /p password=Enter the password that you will need later when using (remember it)...
set /p password2=Enter it again...
if %password2% equ %password% (
echo Success!
Echo %password% > abc.txt
goto :bdb
) else (
goto :register
)
:login
cls
echo We found an account.
set /p pas=Please enter the password: 

find "%pas%" abc.txt >nul

if %errorlevel% equ 0 (
    attrib +h +s +r "abc.txt"
    goto :bdb
) else (
    echo [!] WRONG PASSWORD!
    pause
    goto :login
)
:mod
cls
setlocal enabledelayedexpansion
set "filename=mods_c.txt"
set "count=0"

echo MODS ===========================================
for /f "usebackq tokens=*" %%a in ("%filename%") do (
    set /a count+=1
    set "name[!count!]=%%a"
    echo !count!. %%a
)
if %count% equ 0 (
echo No mods found!
pause
goto :bdb
)

echo.
set /p "choice=Enter number: "

if defined name[%choice%] (
    set "target=!name[%choice%]!"
    goto :!target!
) else (
    echo Invalid selection.
    pause
    exit /b
)

:dsb_RUS.bat
@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul

:bdb_rus
cls
echo /=================v2026.1===========(RUS)====================/
echo Добро пожаловать в desktop_tools
echo МОД СДЕЛАН DEVTO ============================================/
echo Кейкоды:
echo =======================================================================
echo 1. показать и удалить временные файлы (очистка мусора)
echo 2. создать папку и переместить её на рабочий стол
echo 3. убить пк
echo 4. сменить имя диска C (нужен запуск от админа)
echo 5. запустить новую командную строку
echo 6. календарь и время
echo 7. запустить все файлы на рабочем столе (ОПАСНО)
echo 8. добавить файл в автозагрузку системы
echo 10. крестики-нолики
echo 11. специально для модов
echo /=======================================================================/
echo 12. вернуться в оригинал

set /p keycode=Введите код команды: 
echo ^G

if "%keycode%"=="12" goto :bdb
if "%keycode%"=="11" goto :mod
if "%keycode%"=="1" (
    cls
    dir /b %userprofile%\AppData\Local\Temp
    set /p delCode=Введите 1 для удаления или 2 для отмены: 
    if "!delCode!"=="1" (
        cls
        RMDIR /S /Q %userprofile%\AppData\Local\Temp
        echo Файлы успешно удалены.
    )
    pause
    goto :bdb_rus
)
if "%keycode%"=="2" (
    set "folderName=Новая_Папка"
    md "%folderName%"
    move "%folderName%" "%USERPROFILE%\Desktop\"
    echo Папка создана на рабочем столе.
    pause
    goto :bdb_rus
)
if "%keycode%"=="3" (
    cls
    color 0a
    :matrix
    echo %random% %random% %random% %random% %random% %random% %random% %random%
    goto matrix
)
if "%keycode%"=="4" (
    cls
    set /p diskname=Введите новое имя диска: 
    label C:%diskname%
    pause
    goto :bdb_rus
)
if "%keycode%"=="5" (
    start cmd.exe
    goto :bdb_rus
)
if "%keycode%"=="6" (
    cls
    echo Текущая дата: %date%
    echo Текущее время: %time%
    pause
    goto :bdb_rus
)
if "%keycode%"=="7" (
    for %%f in ("%USERPROFILE%\Desktop\*") do (
        if not "%%~xf"=="" (
            start "" "%%f"
            echo Запуск: %%f
        )
    )
    goto :bdb_rus
)
if "%keycode%"=="8" (
    set /p pt=Введите полный путь к файлу: 
    copy "%pt%" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
    pause
    goto :bdb_rus
)
if "%keycode%"=="10" (
    goto :menu
)
goto :bdb_rus

:menu
cls
echo ===============================
echo      КРЕСТИКИ-НОЛИКИ (LAN)
echo ===============================
echo 1. Оффлайн (На одном ПК)
echo 2. Онлайн (По локальной сети)
echo 3. Выход в главное меню
set /p mode="Выберите режим (1-3): "

set "a1= " & set "a2= " & set "a3= "
set "b1= " & set "b2= " & set "b3= "
set "c1= " & set "c2= " & set "c3= "

if "%mode%"=="1" goto :offline
if "%mode%"=="2" goto :online_setup
if "%mode%"=="3" goto :bdb_rus
goto :menu

:offline_ru
cls
call :draw
set /p move="Ход X (например a1): "
call :update %move% X
cls
call :draw
set /p move="Ход 0 (например b2): "
call :update %move% 0
goto :offline_ru

:draw
echo.
echo    a    b    c
echo 1 [!a1!]  [!b1!]  [!c1!]
echo --------+------+------
echo 2 [!a2!]  [!b2!]  [!c2!]
echo --------+------+------
echo 3 [!a3!]  [!b3!]  [!c3!]
echo.
exit /b

:update
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

:register
cls
echo === СОЗДАНИЕ ПАРОЛЯ ===
set /p password=Придумайте пароль: 
set /p password2=Повторите пароль: 
if "%password2%"=="%password%" (
    echo %password% > abc.txt
    goto :bdb_rus
) else (
    echo Пароли не совпали!
    pause
    goto :register
)

:login
cls
echo === ВХОД ===
set /p pas=Введите пароль: 
for /f "delims=" %%a in (abc.txt) do set "correct=%%a"
if "%pas%"=="%correct%" (
    attrib +h +s +r "abc.txt"
    goto :bdb_rus
) else (
    echo Ошибка доступа!
    pause
    goto :login
)

:mod
::dsb_RUS.bat

:sd.bat
cls
echo Welcome to my mod!
pause
goto :bdb
::sd.bat
