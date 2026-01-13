@echo off
REM ============================================================
REM   Static Salesman Portal - Git Deploy Helper
REM   Ageint Security Solutions
REM ============================================================

echo.
echo ============================================================
echo    DEPLOY TO GITHUB
echo ============================================================
echo.

REM Check if git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Git is not installed!
    echo.
    echo Please install Git from: https://git-scm.com/downloads
    echo.
    pause
    exit /b 1
)

echo Current changes:
echo.
git status -s

echo.
echo Enter commit message (or press Ctrl+C to cancel):
set /p commit_msg="> "

if "%commit_msg%"=="" (
    echo.
    echo [ERROR] No commit message provided!
    pause
    exit /b 1
)

echo.
echo Adding files to Git...
git add .

echo Committing changes...
git commit -m "%commit_msg%"

if errorlevel 1 (
    echo.
    echo [WARNING] Commit failed. Nothing to commit or error occurred.
    pause
    exit /b 1
)

echo Pushing to GitHub...
git push origin main

if errorlevel 1 (
    echo.
    echo [ERROR] Push failed!
    echo.
    echo If this is your first push, you may need to set up the remote:
    echo   git remote add origin https://github.com/ageintsec-tutorials/QR-CODE.git
    echo   git push -u origin main
    echo.
    pause
    exit /b 1
)

echo.
echo ============================================================
echo    DEPLOYMENT SUCCESSFUL!
echo ============================================================
echo.
echo Your changes are now live at:
echo https://ageintsec-tutorials.github.io/QR-CODE
echo.
echo (GitHub Pages may take 1-2 minutes to update)
echo.
pause
