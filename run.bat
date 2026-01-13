@echo off
REM ============================================================
REM   Static Salesman Portal - Launcher
REM   Ageint Security Solutions
REM ============================================================

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo.
    echo [ERROR] Python is not installed or not in PATH!
    echo.
    echo Please run "install.bat" first to set up the environment.
    echo.
    pause
    exit /b 1
)

REM Check if dependencies are installed
python -c "import qrcode, jinja2" >nul 2>&1
if errorlevel 1 (
    echo.
    echo [ERROR] Required packages are not installed!
    echo.
    echo Please run "install.bat" first to install dependencies.
    echo.
    pause
    exit /b 1
)

REM Run the generator
python generate_salesman.py

REM Keep window open if there was an error
if errorlevel 1 (
    echo.
    pause
)
