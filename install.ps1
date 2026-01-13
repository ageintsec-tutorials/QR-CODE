# ============================================================
#   Static Salesman Portal - Installer (PowerShell)
#   Ageint Security Solutions
# ============================================================

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "   STATIC SALESMAN PORTAL - INSTALLER" -ForegroundColor Cyan
Write-Host "   Ageint Security Solutions" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

# Check if Python is installed
try {
    $pythonVersion = python --version 2>&1
    Write-Host "[OK] Python is installed." -ForegroundColor Green
    Write-Host $pythonVersion
    Write-Host ""
} catch {
    Write-Host "[ERROR] Python is not installed or not in PATH!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Python 3.7 or higher from:"
    Write-Host "https://www.python.org/downloads/"
    Write-Host ""
    Write-Host "Make sure to check 'Add Python to PATH' during installation."
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

# Install required packages
Write-Host "Installing required Python packages..." -ForegroundColor Yellow
Write-Host ""

python -m pip install --upgrade pip
if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "[ERROR] Failed to upgrade pip!" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

python -m pip install -r requirements.txt
if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "[ERROR] Failed to install dependencies!" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "============================================================" -ForegroundColor Green
Write-Host "   INSTALLATION COMPLETE!" -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Green
Write-Host ""
Write-Host "You can now run the salesman generator by:"
Write-Host "  1. Double-clicking 'run.bat'"
Write-Host "  2. Or running: python generate_salesman.py"
Write-Host ""
Read-Host "Press Enter to exit"
