@echo off
:start
pip list | findstr "keyboard" > pip-list-keyboard-check.txt

set FILE=pip-list-keyboard-check.txt
set SEARCH_STRING=keyboard

for /f "usebackq tokens=*" %%a in ("%FILE%") do (
    echo %%a | findstr /i "%SEARCH_STRING%" >nul
    if not errorlevel 1 (
        echo Found "%SEARCH_STRING%" in file "%FILE%"
		echo You do not need to install this package!. 
		del pip-list-keyboard-check.txt
		exit
    ) else (
        echo "%SEARCH_STRING%" not found in file "%FILE%"
		echo Installing new package!.
		pip install keyboard 
		del pip-list-keyboard-check.txt
		exit 
    )
)
