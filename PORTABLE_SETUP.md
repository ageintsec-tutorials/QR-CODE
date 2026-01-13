# 📦 Portable Setup Guide

This guide explains how to make the Static Salesman Portal **completely portable** so it can run on any Windows computer without installing Python system-wide.

## 🎯 Option 1: Portable Python (Recommended)

### Download Portable Python

1. **Download WinPython** (Portable Python distribution):
   - Visit: https://winpython.github.io/
   - Download the latest **WinPython64** (not the dot version)
   - Example: `Winpython64-3.12.1.0.exe`

2. **Extract WinPython**:
   - Run the downloaded `.exe`
   - Extract to this project folder: `QR Code Ageint\WPy64-31210\`
   - This creates a portable Python installation

### Setup Portable Environment

3. **Install Dependencies**:
   - Navigate to: `WPy64-31210\scripts\`
   - Double-click: `env.bat` (opens a command prompt)
   - In the command prompt, run:
     ```bash
     cd ..\..
     pip install -r requirements.txt
     ```

4. **Create Portable Launcher**:
   - Use the provided `run_portable.bat` file
   - Double-click to run without system Python

### Folder Structure
```
QR Code Ageint/
├── WPy64-31210/              # Portable Python (don't commit to Git)
├── generate_salesman.py
├── run_portable.bat          # Launches with portable Python
├── requirements.txt
└── ... (other files)
```

---

## 🎯 Option 2: Python Embedded Distribution

### Download Python Embedded

1. **Get Python Embedded**:
   - Visit: https://www.python.org/downloads/windows/
   - Scroll to "Windows embeddable package (64-bit)"
   - Download the `.zip` file (e.g., `python-3.12.1-embed-amd64.zip`)

2. **Extract to Project**:
   - Create folder: `QR Code Ageint\python-embed\`
   - Extract all files into this folder

3. **Enable pip**:
   - Download: https://bootstrap.pypa.io/get-pip.py
   - Save to: `QR Code Ageint\python-embed\`
   - Edit `python312._pth` (in python-embed folder)
   - Uncomment the line: `import site`
   - Run in Command Prompt:
     ```bash
     cd python-embed
     python get-pip.py
     cd ..
     python-embed\python -m pip install -r requirements.txt
     ```

4. **Use Embedded Launcher**:
   - Double-click: `run_embedded.bat`

---

## 🎯 Option 3: PyInstaller Executable (Advanced)

### Create Standalone .exe

This creates a single executable file that includes Python and all dependencies.

1. **Install PyInstaller** (on your development machine):
   ```bash
   pip install pyinstaller
   ```

2. **Create Executable**:
   ```bash
   pyinstaller --onefile --name="Salesman_Generator" generate_salesman.py
   ```

3. **Distribute**:
   - The `.exe` will be in `dist\Salesman_Generator.exe`
   - Copy it to your project root
   - Users can double-click the `.exe` without Python installed

**Note**: The executable is ~15-20 MB and includes all dependencies.

---

## 📝 Distribution Checklist

### For Portable Distribution (ZIP Package)

Include these files when sharing:

```
✅ All project files (generate_salesman.py, templates/, etc.)
✅ WinPython folder OR python-embed folder
✅ run_portable.bat or run_embedded.bat
✅ QUICK_START.txt
❌ .git folder (exclude from ZIP)
❌ __pycache__ (exclude)
```

### Steps to Create Distribution Package

1. **Clean the folder**:
   ```bash
   # Delete these if they exist:
   - .git/
   - __pycache__/
   - *.pyc files
   ```

2. **Add portable Python** (see Option 1 or 2 above)

3. **Install dependencies** in portable Python

4. **Test the launcher**:
   - Double-click `run_portable.bat` or `run_embedded.bat`
   - Verify it works without system Python

5. **Create ZIP**:
   - Right-click folder → Send to → Compressed (zipped) folder
   - Name it: `Salesman_Portal_Portable_v1.0.zip`

6. **Distribute**:
   - Upload to shared drive, email, or USB stick
   - Users extract and run the `.bat` file

---

## 🔐 Security Notes

- **Portable Python** contains a full Python interpreter (~100-200 MB)
- **Don't commit** portable Python to Git (add to `.gitignore`)
- Only commit the project files and scripts
- Users download portable Python separately or you provide a ZIP

---

## 📊 Size Comparison

| Method | Size | Pros | Cons |
|--------|------|------|------|
| **Portable Python (WinPython)** | ~200 MB | Full Python environment, easy updates | Large download |
| **Embedded Python** | ~15 MB | Smaller, official distribution | Requires manual pip setup |
| **PyInstaller .exe** | ~15 MB | Single file, no Python needed | Harder to update |
| **System Python** | 0 MB | No extra files | Requires user installation |

---

## 🚀 Recommended Approach

For **maximum portability**:

1. Use **WinPython** (Option 1)
2. Include `run_portable.bat` launcher
3. Distribute as ZIP file
4. Include `QUICK_START.txt` instructions

Users simply:
1. Extract ZIP
2. Double-click `run_portable.bat`
3. Done!

---

Need help setting up portable mode? Check the included launcher scripts or README.md.
