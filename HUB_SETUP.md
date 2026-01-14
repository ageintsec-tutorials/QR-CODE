# Hub App Setup Guide

## ✅ You're Ready to Use the Hub!

The hub app is now properly configured and safe to use.

## 🔐 Setting Admin Password

**Yes, you can press "Set Admin Password" in the hub now!**

### What Happens When You Click It:

1. The hub runs `generate_password_hash.py`
2. You'll be prompted to enter a password (or use default "Ageint2016$")
3. It creates `password_config.txt` with the hash and salt
4. This file stays LOCAL only (never deployed to GitHub)

### Files Protected from Deployment:

The following files are in `.gitignore` and will **NEVER** be uploaded to GitHub:

- ✅ `hub_app.py` - Your local admin interface
- ✅ `generate_password_hash.py` - Password hash generator
- ✅ `password_config.txt` - Contains your password hash
- ✅ `calculate_hash.py` - Temporary hash calculator
- ✅ `.hub_state.json` - Hub state tracking
- ✅ `staff.json` / `tech.json` - Staff member data files

### Files That WILL Deploy:

- ✅ `index.html` - Admin dashboard (with embedded hash)
- ✅ `staff/*.html` - Staff profile pages
- ✅ `qrcodes/*.png` - QR code images
- ✅ `templates/*.html` - Page templates
- ✅ `*.py` scripts (except hub and password files)

## 🚀 How to Use the Hub

### 1. First Time Setup

Run the hub:
```bash
python hub_app.py
```

Click **"Set Admin Password"** button:
- Enter your password (or use default)
- This creates `password_config.txt` locally

### 2. Add Staff Members

1. Enter name in "Full Name" field
2. Select role (Technician, Salesman, etc.)
3. Click **"Add / Update Profile"**
4. Profile page and QR code are generated automatically
5. Dashboard is updated automatically

### 3. Deploy to GitHub

1. Click **"Deploy to GitHub"** button
2. Enter commit message
3. Hub automatically:
   - Stages all changes
   - Commits with your message
   - Pushes to GitHub
   - Updates live site

### 4. Manage Staff

- **Deactivate:** Removes from dashboard but keeps files
- **Delete:** Permanently removes profile and QR code
- Both update the dashboard automatically

## 🔒 Security Notes

### Password Hash Flow:

```
Local Only:
├── password_config.txt (hash + salt)
└── generate_password_hash.py (generator)

Deployed to GitHub:
└── index.html (embedded hash only)
```

**The actual password is NEVER stored anywhere!**

Only the SHA-256 hash is embedded in `index.html`, which is safe to deploy.

## ⚠️ Important Reminders

1. **Don't commit password files manually**
   - They're in `.gitignore` for a reason
   - The hub handles everything automatically

2. **Keep password_config.txt backed up locally**
   - It's not in Git, so back it up yourself
   - Or just regenerate it if lost

3. **Use the hub for all operations**
   - Don't manually edit staff.json or tech.json
   - Let the hub manage everything

## 🎯 Quick Reference

| Action | Where |
|--------|-------|
| Set password | Hub → "Set Admin Password" |
| Add staff | Hub → Enter name → "Add / Update Profile" |
| Remove staff | Hub → Click ⋯ → "Delete" |
| Deploy | Hub → "Deploy to GitHub" |
| View files | Hub → "Open Project Folder" |

## ✅ Verification

To verify everything is protected:

```bash
# Check what's in .gitignore
type .gitignore

# Check what Git will commit
git status

# Verify password files are ignored
git check-ignore password_config.txt
git check-ignore generate_password_hash.py
```

Both should output the filename (meaning they're ignored).

---

**You're all set! Go ahead and click "Set Admin Password" in the hub.** 🎉
