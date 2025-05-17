@echo off
REM Push updated files to GitHub from this folder

REM Set the current directory as the working repo
cd /d "%~dp0"

REM Stage all changes
git add .

REM Commit with timestamped message
for /f %%a in ('powershell -Command "Get-Date -Format yyyy-MM-dd_HH:mm:ss"') do set datetime=%%a
git commit -m "Automated push on %datetime%" 

REM Push to remote GitHub
git push origin main

pause
