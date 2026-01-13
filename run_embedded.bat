@echo off
REM ============================================================
REM   Embedded Python Launcher
REM   For use with Python embedded distribution
REM ============================================================

if exist "python-embed\python.exe" (
    echo Using embedded Python...
    echo.
    python-embed\python.exe generate_salesman.py
) else if exist "python\python.exe" (
    echo Using embedded Python...
    echo.
    python\python.exe generate_salesman.py
) else (
    echo.
    echo [ERROR] Embedded Python not found!
    echo.
    echo Expected location: python-embed\python.exe
    echo.
    echo Please set up embedded Python first (see PORTABLE_SETUP.md)
    echo Or use run.bat to use system Python instead.
    echo.
    pause
    exit /b 1
)

if errorlevel 1 (
    echo.
    pause
)
