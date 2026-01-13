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

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python is not installed or not in PATH!
    echo.
    echo Please install Python 3.7 or higher from:
    echo https://www.python.org/downloads/
    echo.
    echo Make sure to check "Add Python to PATH" during installation.
    echo.
    pause
    exit /b 1
)

echo [OK] Python is installed.
python --version
echo.

REM Install required packages
echo Installing required Python packages...
echo.
python -m pip install --upgrade pip
python -m pip install -r requirements.txt

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
