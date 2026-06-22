@echo off
setlocal
cd /d "%~dp0"
if not defined FFDEC_CLI set "FFDEC_CLI=%~dp0tools\ffdec\ffdec-cli.exe"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0build-swf.ps1" %*
if errorlevel 1 pause
