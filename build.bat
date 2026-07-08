@echo off
"C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in "%~dp0c1.ahk" /out "%~dp0c1.exe" /bin "C:\Program Files\AutoHotkey\Compiler\Unicode 64-bit.bin" /icon "%~dp0sakuramirai.ico"
echo.
echo Build complete: %~dp0c1.exe
pause
