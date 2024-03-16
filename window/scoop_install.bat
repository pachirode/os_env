REM @echo off

REM Check if current os system install PowerShell

set scoop_root="C:\scoop"

powershell -Command "exit 0"

if %errorlevel% neq 0 (
	echo "PowerShell is not installed on this system"
	exit /b 1
)

powershell -File install_scoop.ps1

