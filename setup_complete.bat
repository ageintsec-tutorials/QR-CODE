@echo off
REM ============================================================
REM   Complete Setup and Test Script
REM   Installs dependencies and runs a test generation
REM ============================================================

echo.
echo ============================================================
echo    SALESMAN PORTAL - COMPLETE SETUP
echo ============================================================
echo.

REM Step 1: Install dependencies
echo [Step 1/3] Installing dependencies...
echo.
call install.bat

if errorlevel 1 (
    echo.
    echo [ERROR] Installation failed!
    pause
    exit /b 1
)

echo.
echo.
echo [Step 2/3] Testing file structure...
echo.

if not exist "templates\profile_template.html" (
    echo [ERROR] Missing template files!
    pause
    exit /b 1
)

if not exist "salesmen\" (
    mkdir salesmen
)

if not exist "qrcodes\" (
    mkdir qrcodes
)

echo [OK] All directories present.
echo.

echo.
echo [Step 3/3] Setup complete!
echo.
echo ============================================================
echo    ✓✓✓ READY TO USE! ✓✓✓
echo ============================================================
echo.
echo 🎉 SUCCESS! Everything is installed and ready!
echo.
echo WHAT TO DO NEXT:
echo   1. Double-click "run.bat" to create your first salesman
echo   2. Type a name when asked (example: John Smith)
echo   3. Press Enter and wait 5 seconds
echo   4. Double-click "index.html" to see your work!
echo.
echo 📖 NEED HELP?
echo   - Not tech-savvy? Read: SIMPLE_GUIDE.txt
echo   - Don't know which file to click? Read: VISUAL_GUIDE.txt
echo.
pause
