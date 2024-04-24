@echo off
 
where python > nul 2>&1
 
if %errorlevel% == 0 (
	echo Python is installed.
	echo Exiting now ...
	exit
)  else (
	echo Python is not installed.
	cd "C:\Program Files"
	set PYTHON_VERSION=3.12.3
	set PYTHON_URL=https://www.python.org/ftp/python/%PYTHON_VERSION%/python-%PYTHON_VERSION%-amd64.exe
	set INSTALLER_FILENAME=python-%PYTHON_VERSION%-amd64.exe
	curl -o %INSTALLER_FILENAME% %PYTHON_URL%
	%INSTALLER_FILENAME% /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
	python --version
	del %INSTALLER_FILENAME%
)