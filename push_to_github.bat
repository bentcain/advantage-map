@echo off
setlocal enabledelayedexpansion

echo 🔄 Committing and pushing changes to GitHub...

cd /d "%~dp0"

git add .
git commit -m "Update site content"
git push

:: Get current folder name to build GitHub Pages URL
for %%I in ("%cd%") do set "FOLDERNAME=%%~nxI"

:: Open the live GitHub Pages site
start https://bentcain.github.io/!FOLDERNAME!/

echo ✅ Done.
pause
