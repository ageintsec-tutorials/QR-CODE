@echo off
REM ============================================================
REM   Static Salesman Portal - Installer
REM   Ageint Security Solutions
REM ============================================================

echo.
echo ============================================================
echo    STATIC SALESMAN PORTAL - INSTALLER
echo    Ageint Security Solutions
echo ============================================================
echo.

REM Check if Python is installed (try multiple commands)
set PYTHON_CMD=

py --version >nul 2>&1
if not errorlevel 1 (
    set PYTHON_CMD=py
    goto :python_found
)

python --version >nul 2>&1
if not errorlevel 1 (
    set PYTHON_CMD=python
    goto :python_found
)

python3 --version >nul 2>&1
if not errorlevel 1 (
    set PYTHON_CMD=python3
    goto :python_found
)

echo [ERROR] Python is not installed or not accessible!
echo.
pause
exit /b 1

:python_found
echo [OK] Python is installed.
%PYTHON_CMD% --version
echo.

REM Install required packages
echo Installing required Python packages...
echo.
%PYTHON_CMD% -m pip install --upgrade pip
%PYTHON_CMD% -m pip install -r requirements.txt

if errorlevel 1 (
    echo.
    echo [ERROR] Failed to install dependencies!
    echo.
    pause
    exit /b 1
)

echo.
echo ============================================================
echo    INSTALLATION COMPLETE!
echo ============================================================
echo.
echo You can now run the salesman generator by:
echo   1. Double-clicking "run.bat"
echo   2. Or running: python generate_salesman.py
echo.
pause
