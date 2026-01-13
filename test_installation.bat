@echo off
REM ============================================================
REM   Installation Test Script
REM   Verifies that everything is set up correctly
REM ============================================================

echo.
echo ============================================================
echo    TESTING INSTALLATION
echo ============================================================
echo.

REM Test 1: Python availability
echo [Test 1/5] Checking Python installation...
python --version >nul 2>&1
if errorlevel 1 (
    echo [FAIL] Python is not installed or not in PATH
    echo.
    set TEST_FAILED=1
) else (
    python --version
    echo [PASS] Python is available
)
echo.

REM Test 2: Required modules
echo [Test 2/5] Checking required Python modules...
python -c "import qrcode" >nul 2>&1
if errorlevel 1 (
    echo [FAIL] qrcode module not installed
    echo   Run: pip install qrcode[pil]
    set TEST_FAILED=1
) else (
    echo [PASS] qrcode module installed
)

python -c "import jinja2" >nul 2>&1
if errorlevel 1 (
    echo [FAIL] jinja2 module not installed
    echo   Run: pip install jinja2
    set TEST_FAILED=1
) else (
    echo [PASS] jinja2 module installed
)

python -c "import PIL" >nul 2>&1
if errorlevel 1 (
    echo [FAIL] PIL module not installed
    echo   Run: pip install Pillow
    set TEST_FAILED=1
) else (
    echo [PASS] PIL (Pillow) module installed
)
echo.

REM Test 3: File structure
echo [Test 3/5] Checking file structure...
if not exist "generate_salesman.py" (
    echo [FAIL] generate_salesman.py not found
    set TEST_FAILED=1
) else (
    echo [PASS] generate_salesman.py exists
)

if not exist "templates\profile_template.html" (
    echo [FAIL] profile_template.html not found
    set TEST_FAILED=1
) else (
    echo [PASS] profile_template.html exists
)

if not exist "templates\admin_list_template.html" (
    echo [FAIL] admin_list_template.html not found
    set TEST_FAILED=1
) else (
    echo [PASS] admin_list_template.html exists
)
echo.

REM Test 4: Directory structure
echo [Test 4/5] Checking directory structure...
if not exist "salesmen\" (
    mkdir salesmen
    echo [INFO] Created salesmen directory
)
echo [PASS] salesmen directory exists

if not exist "qrcodes\" (
    mkdir qrcodes
    echo [INFO] Created qrcodes directory
)
echo [PASS] qrcodes directory exists

if not exist "templates\" (
    echo [FAIL] templates directory not found
    set TEST_FAILED=1
) else (
    echo [PASS] templates directory exists
)
echo.

REM Test 5: Python script syntax
echo [Test 5/5] Checking Python script syntax...
python -m py_compile generate_salesman.py >nul 2>&1
if errorlevel 1 (
    echo [FAIL] generate_salesman.py has syntax errors
    set TEST_FAILED=1
) else (
    echo [PASS] generate_salesman.py syntax is valid
)
echo.

REM Final result
echo ============================================================
if defined TEST_FAILED (
    echo    ❌ TESTS FAILED
    echo ============================================================
    echo.
    echo Some tests failed. Please fix the issues above.
    echo.
    echo SOLUTIONS:
    echo   - If Python not found: Install Python with "Add to PATH" checked
    echo   - If modules missing: Double-click install.bat
    echo   - Still stuck? Read SIMPLE_GUIDE.txt for help
    echo.
) else (
    echo    ✅ ALL TESTS PASSED!
    echo ============================================================
    echo.
    echo 🎉 Your installation is ready to use!
    echo.
    echo NEXT STEPS:
    echo   1. Double-click run.bat to generate salesman profiles
    echo   2. Type a name when asked
    echo   3. Press Enter and wait
    echo   4. Open index.html to see results!
    echo.
)

pause
