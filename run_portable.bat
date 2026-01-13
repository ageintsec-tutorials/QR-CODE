@echo off
REM ============================================================
REM   Portable Python Launcher
REM   For use with WinPython portable distribution
REM ============================================================

REM Try to find portable Python in common locations
set PORTABLE_PYTHON=

if exist "WPy64-31210\python-3.12.1.amd64\python.exe" (
    set PORTABLE_PYTHON=WPy64-31210\python-3.12.1.amd64\python.exe
) else if exist "WPy64\python-3.12.1.amd64\python.exe" (
    set PORTABLE_PYTHON=WPy64\python-3.12.1.amd64\python.exe
) else if exist "WinPython\python.exe" (
    set PORTABLE_PYTHON=WinPython\python.exe
) else if exist "python-portable\python.exe" (
    set PORTABLE_PYTHON=python-portable\python.exe
)

if "%PORTABLE_PYTHON%"=="" (
    echo.
    echo [WARNING] Portable Python not found!
    echo.
    echo Trying system Python instead...
    echo.
    
    python --version >nul 2>&1
    if errorlevel 1 (
        echo [ERROR] No Python installation found!
        echo.
        echo Please either:
        echo   1. Install Python from https://www.python.org/
        echo   2. Or set up portable Python (see PORTABLE_SETUP.md)
        echo.
        pause
        exit /b 1
    )
    
    REM Use system Python
    python generate_salesman.py
) else (
    echo Using portable Python: %PORTABLE_PYTHON%
    echo.
    "%PORTABLE_PYTHON%" generate_salesman.py
)

if errorlevel 1 (
    echo.
    pause
)
