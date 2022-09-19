@echo off
setlocal enableDelayedExpansion
cd incoming
set dir=%cd%
for %%a in (*.zip) do (
    set folder=!dir!\%%a
    echo !folder!
    powershell.exe -NoP -NonI -Command "Expand-Archive '!folder!' '%dir%\temp\%%a'"
)
cd ..