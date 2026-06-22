@echo off
setlocal
cd /d "%~dp0"
if not defined FFDEC_CLI set "FFDEC_CLI=%~dp0tools\ffdec\ffdec-cli.exe"
if not defined BASE_SWF set "BASE_SWF=%~dp0base\base.swf"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0build-swf.ps1" %*
if errorlevel 1 pause
