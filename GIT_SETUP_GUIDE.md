# Git Setup & Operation Guide

## 🚨 Current Issues Detected

Your Git repository has the following problems that need immediate fixing:

### Issue #1: Detached HEAD State
**Problem:** You're not on any branch (detached HEAD)  
**Impact:** Commits won't be saved properly  
**Fix:** Run `fix_git.bat`

### Issue #2: Generated Files Not Tracked
**Problem:** Staff HTML pages and QR codes are not being committed  
**Impact:** Your actual output won't deploy to GitHub Pages  
**Fix:** Run `fix_git.bat` then `deploy.bat`

---

## ✅ Quick Fix (Run This Now)

```bash
fix_git.bat
```

This will:
1. ✅ Switch you to the `main` branch
2. ✅ Stage all your files (including staff pages and QR codes)
3. ✅ Prepare for deployment

Then deploy:
```bash
deploy.bat
```

---

## 📋 Proper Git Workflow

### First Time Setup (One-Time)

1. **Initialize repository** (if not done):
   ```bash
   git init
   git branch -M main
   ```

2. **Add remote** (if not done):
   ```bash
   git remote add origin https://github.com/ageintsec-tutorials/QR-CODE.git
   ```

3. **Configure user** (if not done):
   ```bash
   git config user.name "Your Name"
   git config user.email "your.email@example.com"
   ```

### Daily Workflow

1. **Generate staff profiles**:
   ```bash
   python generate_salesman.py
   ```

2. **Check what changed**:
   ```bash
   git status
   ```

3. **Deploy to GitHub**:
   ```bash
   deploy.bat
   ```
   - Enter commit message
   - Automatically adds all files
   - Commits and pushes

---

## 📂 What Should Be Tracked by Git

### ✅ MUST Be Committed (Deploy to GitHub Pages):
- `index.html` - Admin dashboard
- `staff/*.html` - All staff profile pages
- `qrcodes/*.png` - All QR code images
- `templates/*.html` - Template files
- `*.py` - Python scripts
- `*.bat` - Batch launcher files
- `README.md` - Documentation
- `requirements.txt` - Dependencies
- `.gitignore` - Git configuration

### ❌ Should NOT Be Committed (In .gitignore):
- `__pycache__/` - Python cache
- `*.pyc` - Compiled Python
- `venv/`, `env/` - Virtual environments
- `.vscode/`, `.idea/` - IDE settings
- `WinPython*/` - Portable Python installations
- `.DS_Store`, `Thumbs.db` - OS files

---

## 🔍 Verification Commands

Check if everything is set up correctly:

```bash
# Check current branch (should be "main")
git branch

# Check remote is configured
git remote -v

# Check what files are tracked
git ls-files

# Check if staff pages are tracked
git ls-files staff/

# Check if QR codes are tracked
git ls-files qrcodes/
```

**Expected Results:**
- Branch: `* main`
- Remote: `origin https://github.com/ageintsec-tutorials/QR-CODE.git`
- Staff files: Should list all `.html` files in staff/
- QR codes: Should list all `.png` files in qrcodes/

---

## 🐛 Common Issues & Solutions

### "Nothing to commit, working tree clean"
**Cause:** Files are either already committed OR not being tracked  
**Solution:**
```bash
# Check what Git sees
git status

# Add everything
git add -A

# Try committing again
git commit -m "Update"
```

### "Not on any branch" / "Detached HEAD"
**Cause:** Git HEAD is not pointing to a branch  
**Solution:**
```bash
git checkout main
# Or if main doesn't exist:
git checkout -b main
```

### "Staff pages not showing on website"
**Cause:** Files not committed to Git  
**Solution:**
```bash
# Verify files exist
dir staff\*.html

# Add to Git
git add staff/*.html qrcodes/*.png

# Commit
git commit -m "Add staff profiles"

# Push
git push origin main
```

### "Push rejected"
**Cause:** Local branch diverged from remote  
**Solution:**
```bash
# Pull latest changes
git pull origin main

# Then push
git push origin main
```

---

## 📊 Health Check Script

Run `check_git.bat` to see full diagnostic information including:
- Current directory
- Branch status  
- Remote configuration
- Tracked vs untracked files
- Recent commits

---

## 🎯 Best Practices

1. **Always work on the `main` branch**
   - Verify: `git branch` should show `* main`

2. **Commit generated files**
   - Staff HTML pages MUST be committed
   - QR codes MUST be committed
   - These are what GitHub Pages serves

3. **Use descriptive commit messages**
   - Good: "Add Jake Harvard profile"
   - Bad: "Update" or "Changes"

4. **Deploy after each profile generation**
   - Generate profile → Run deploy.bat → Done
   - Don't accumulate multiple changes

5. **Verify deployment**
   - Wait 1-2 minutes after push
   - Visit your GitHub Pages URL
   - Check that new profile appears

---

## 🔧 Maintenance Commands

### Reset to clean state (CAREFUL!):
```bash
git reset --hard origin/main
```

### See what will be deployed:
```bash
git diff --name-only
```

### Undo last commit (keep changes):
```bash
git reset --soft HEAD~1
```

### Force push (ONLY if necessary):
```bash
git push origin main --force
```

---

## 📝 Current Repository Status

**Remote:** https://github.com/ageintsec-tutorials/QR-CODE.git  
**Branch:** Should be `main`  
**GitHub Pages URL:** https://ageintsec-tutorials.github.io/QR-CODE/

**Files That Should Deploy:**
- Admin dashboard at root
- Staff profiles in `staff/` folder
- QR codes in `qrcodes/` folder
- All accessible via GitHub Pages

---

## ⚠️ CRITICAL: Fix Now

Before making any more changes, run:

```bash
fix_git.bat
```

This ensures:
1. You're on the main branch
2. All files are properly staged
3. Ready for clean deployment

Then verify with:
```bash
check_git.bat
```

---

**Last Updated:** 2026-01-14  
**Status:** ⚠️ NEEDS ATTENTION - Run fix_git.bat
