@echo off
cls
title Wiredolphin - Batch Edition

color 1F

echo.
echo ===============================================================
echo       W I R E D O L P H I N    M U L T I T O O L  v1.0
echo.
echo                        Batch Edition
echo ===============================================================

echo.
echo Press enter to go to the main menu
pause>nul

color 0a


:Menu
cls
echo (1) Ping an IP
echo (2) Identify your Hostname
echo (3) DNS Lookup
echo (4) Network statistics
echo (5) Protocol statistics
echo (6) FTP Client
echo (7) Exit 
echo.
 
choice /c 1234567 /m "Select an option:"

if errorlevel 7 goto option7
if errorlevel 6 goto option6
if errorlevel 5 goto option5
if errorlevel 4 goto option4
if errorlevel 3 goto option3
if errorlevel 2 goto option2
if errorlevel 1 goto option1

:option1
cls
echo ===============================================================
echo                  P I N G   A N  I P 
echo ===============================================================
echo.

cls
set /p userInput="Enter your IP: "
set /p ammountInput="Enter the ammount of times you want to ping: "

echo.

echo  Starting List 
echo  CONNECTING TO IP 
echo  ESTABLISHING TUNNEL...

for /l %%i in (1, 1, %ammountInput%) do (

    ping -n 1 %userInput%

)

pause
goto Menu 

:option2
cls
echo ===============================================================
echo               I D E N T I F Y   H O S T N A M E 
echo ===============================================================
echo.

cls 
echo (1) Current User using the Computer
echo (2) Hostname of the Computer
echo (3) Main Menu

choice /c 123 /m "Select an option:"

if errorlevel 3 goto idOption3
if errorlevel 2 goto idOption2
if errorlevel 1 goto idOption1

:idOption1
cls 
whoami
echo.
echo Press enter to go to the Main menu
pause>nul
goto Menu

:idOption2
cls 
hostname 
echo.
echo Press enter to go to the Main menu
pause>nul
goto Menu

:idOption3
cls 
goto Menu

pause
goto Menu

:option3
cls
echo ===============================================================
echo                  D N S   L O O K U P
echo ===============================================================
echo.

set /p dnsInput="Enter your domain: "
nslookup %dnsInput%

pause
goto Menu

:option4
cls
echo ===============================================================
echo                  N E T W O R K   S T A T S 
echo ===============================================================
echo.

netstat -ano

pause
goto Menu

:option5
cls
echo ===============================================================
echo               P R O T O C O L   S T A T S
echo ===============================================================
echo.

netstat -s

pause
goto Menu

:option6
cls
echo ===============================================================
echo                       F T P   C L I E N T
echo ===============================================================
echo.
echo Connect only to an FTP server you own or are authorised to use.
echo.
set "ftpHost="
set /p "ftpHost=Enter FTP server hostname or IP: "

if not defined ftpHost goto Menu

echo.
echo Connecting to %ftpHost%...
echo Type "bye" to disconnect.
echo.

ftp "%ftpHost%"

pause
goto Menu

:option7
echo bye bye 
exit
