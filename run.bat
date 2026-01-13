@echo off
REM ============================================================
REM   Static Salesman Portal - Launcher
REM   Ageint Security Solutions
REM ============================================================

REM Find Python command
set PYTHON_CMD=

py --version >nul 2>&1
if not errorlevel 1 (
    set PYTHON_CMD=py
    goto :run_script
)

python --version >nul 2>&1
if not errorlevel 1 (
    set PYTHON_CMD=python
    goto :run_script
)

python3 --version >nul 2>&1
if not errorlevel 1 (
    set PYTHON_CMD=python3
    goto :run_script
)

echo.
echo [ERROR] Cannot find Python!
echo Please run install.bat first.
echo.
pause
exit /b 1

:run_script
REM Check if dependencies are installed
%PYTHON_CMD% -c "import qrcode, jinja2" >nul 2>&1
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
%PYTHON_CMD% generate_salesman.py

REM Keep window open if there was an error
if errorlevel 1 (
    echo.
    pause
)
