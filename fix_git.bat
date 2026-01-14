@echo off
REM ============================================================
REM   Git Repository Fix Script
REM   Fixes detached HEAD and ensures proper tracking
REM ============================================================

echo.
echo ============================================================
echo    GIT REPOSITORY FIX
echo ============================================================
echo.

echo [Step 1] Checking out main branch...
git checkout main

if errorlevel 1 (
    echo.
    echo [ERROR] Failed to checkout main branch!
    echo Creating main branch from current state...
    git checkout -b main
)

echo.
echo [Step 2] Current branch status:
git branch
echo.

echo [Step 3] Staging all changes...
git add -A

echo.
echo [Step 4] Files staged for commit:
git status -s

echo.
echo ============================================================
echo    FIX COMPLETE
echo ============================================================
echo.
echo You are now on the main branch.
echo All files have been staged (including staff pages and QR codes).
echo.
echo Next steps:
echo   1. Run: deploy.bat to commit and push
echo   2. Or manually run:
echo      git commit -m "Your message"
echo      git push origin main
echo.
pause
