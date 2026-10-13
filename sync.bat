@echo off
title Sync Portfolio with GitHub
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0sync.ps1"
echo.
echo Press any key to close this window...
pause >nul
