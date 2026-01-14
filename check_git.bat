@echo off
REM ============================================================
REM   Git Status Checker
REM   Use this to diagnose Git issues
REM ============================================================

echo.
echo ============================================================
echo    GIT DIAGNOSTIC TOOL
echo ============================================================
echo.

echo [1] Current Directory:
echo %CD%
echo.

echo [2] Git Version:
git --version 2>nul || echo Git not found!
echo.

echo [3] Git Repository Status:
git status
echo.

echo [4] Git Remote URLs:
git remote -v
echo.

echo [5] Current Branch:
git branch
echo.

echo [6] Files in templates/:
dir /b templates\*.html 2>nul || echo No files found
echo.

echo [7] Files in staff/:
dir /b staff\*.html 2>nul || echo No files found
echo.

echo [8] Files in qrcodes/:
dir /b qrcodes\*.png 2>nul || echo No files found
echo.

echo [9] Untracked files:
git ls-files --others --exclude-standard
echo.

echo [10] Modified but not staged:
git diff --name-only
echo.

echo [11] Staged files:
git diff --cached --name-only
echo.

echo [12] Last 3 commits:
git log --oneline -3 2>nul || echo No commits found
echo.

echo ============================================================
echo    DIAGNOSTIC COMPLETE
echo ============================================================
echo.
echo If you see files listed but deploy.bat doesn't work:
echo   - Make sure you're in the correct directory
echo   - Check if files are in .gitignore
echo   - Try running: git add -A
echo.
pause
