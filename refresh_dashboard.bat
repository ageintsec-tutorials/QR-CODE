@echo off
REM ============================================================
REM   Refresh Dashboard - Regenerate index.html
REM   Ageint Security Solutions
REM ============================================================

echo.
echo ============================================================
echo    REGENERATING ADMIN DASHBOARD
echo ============================================================
echo.

REM Try multiple Python commands
py -c "from generate_salesman import generate_admin_dashboard; generate_admin_dashboard()" 2>nul

if errorlevel 1 (
    python3 -c "from generate_salesman import generate_admin_dashboard; generate_admin_dashboard()" 2>nul
)

if errorlevel 1 (
    python -c "from generate_salesman import generate_admin_dashboard; generate_admin_dashboard()" 2>nul
)

if errorlevel 1 (
    echo.
    echo [ERROR] Could not find Python!
    echo.
    echo Please run this instead:
    echo   py -c "from generate_salesman import generate_admin_dashboard; generate_admin_dashboard()"
    echo.
    echo Or add a staff member using run.bat which will also regenerate index.html
    echo.
    pause
    exit /b 1
)

echo.
echo ============================================================
echo    SUCCESS!
echo ============================================================
echo.
echo index.html has been regenerated with password protection.
echo.
echo Next steps:
echo   1. Push to GitHub: git add . ^&^& git commit -m "Add secure index" ^&^& git push
echo   2. Wait 1-2 minutes
echo   3. Visit: https://ageintsec-tutorials.github.io/QR-CODE/
echo   4. You'll see the login screen!
echo.
echo Password: Ageint2016$
echo.
pause
