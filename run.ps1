# ============================================================
#   Static Salesman Portal - Launcher (PowerShell)
#   Ageint Security Solutions
# ============================================================

# Check if Python is installed
try {
    python --version 2>&1 | Out-Null
} catch {
    Write-Host ""
    Write-Host "[ERROR] Python is not installed or not in PATH!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please run 'install.bat' or 'install.ps1' first to set up the environment."
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

# Check if dependencies are installed
python -c "import qrcode, jinja2" 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "[ERROR] Required packages are not installed!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please run 'install.bat' or 'install.ps1' first to install dependencies."
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

# Run the generator
python generate_salesman.py

# Keep window open if there was an error
if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Read-Host "Press Enter to exit"
}
