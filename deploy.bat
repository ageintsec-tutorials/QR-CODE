@echo off
REM ============================================================
REM   Staff Portal - Git Deploy Helper
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

REM Show current directory
echo Current directory: %CD%
echo.

REM Show detailed status
echo Git Status (Modified/Untracked files):
echo ----------------------------------------
git status

echo.
echo Files that will be deployed:
echo ----------------------------------------
echo Templates:
dir /b templates\*.html 2>nul || echo   (none)
echo Staff Pages:
dir /b staff\*.html 2>nul || echo   (none)
echo QR Codes:
dir /b qrcodes\*.png 2>nul || echo   (none)
echo Documentation:
dir /b *.md 2>nul || echo   (none)

echo.
echo ============================================================
echo.
set /p continue="Do you want to continue with deployment? (y/n): "

if /i not "%continue%"=="y" (
    echo.
    echo Deployment cancelled.
    pause
    exit /b 0
)

echo.
echo Enter commit message:
set /p commit_msg="> "

if "%commit_msg%"=="" (
    echo.
    echo [ERROR] No commit message provided!
    pause
    exit /b 1
)

echo.
echo Adding ALL files to Git (including untracked)...
git add -A

echo.
echo Files staged for commit:
git status -s

echo.
echo Committing changes...
git commit -m "%commit_msg%"

if errorlevel 1 (
    echo.
    echo [WARNING] Commit failed. Nothing to commit or error occurred.
    echo.
    echo This usually means:
    echo   1. No changes were detected
    echo   2. Files might be in .gitignore
    echo   3. You're in the wrong directory
    echo.
    echo Try running check_git.bat for more details.
    pause
    exit /b 1
)

echo.
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
