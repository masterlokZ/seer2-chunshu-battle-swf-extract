@echo off
setlocal
cd /d "%~dp0"
echo [build] One-click build: output will be written to dist\
if not defined FFDEC_CLI set "FFDEC_CLI=%~dp0tools\ffdec\ffdec-cli.exe"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0build-swf.ps1" %*
if errorlevel 1 pause
if not errorlevel 1 (
  echo [build] Done. Check the dist folder.
  pause
)
