# AgeintSec Staff Portal

A static HTML-based portal system for security company staff (salesmen and technicians), deployed on GitHub Pages. Each staff member gets their own profile page with a QR code that links to your Google Reviews page.

**Perfect for collecting customer reviews!** When customers scan any staff member's QR code, they're taken directly to your [Google Reviews page](https://search.google.com/local/writereview?placeid=ChIJ65CsoCI0R4YRAssAAswitSw) to leave feedback.

---

## 🌟 **NEW USER? START HERE!**

**Not tech-savvy?** We've got you covered! 👇

- 📘 **[SIMPLE_GUIDE.txt](SIMPLE_GUIDE.txt)** - For non-technical users (plain English, no jargon!)
- 📸 **[VISUAL_GUIDE.txt](VISUAL_GUIDE.txt)** - Visual guide showing which files to click
- ⭐ **[🌟 READ_ME_FIRST.txt](🌟%20READ_ME_FIRST.txt)** - Quick orientation guide

**Already comfortable with computers?** Continue reading below! 👇

---

## 🌐 Live Demo

**Admin Dashboard:** [https://ageintsec-tutorials.github.io/QR-CODE](https://ageintsec-tutorials.github.io/QR-CODE)

## 🎯 Features

- ✅ **Static HTML Generation** - No server needed, works on GitHub Pages
- ✅ **Google Review QR Codes** - All QR codes point to your Google Reviews page
- ✅ **Support for Multiple Roles** - Salesmen, Technicians, or custom roles
- ✅ **Modern Material Design** - Built with Materialize CSS
- ✅ **Mobile Responsive** - Works perfectly on all devices
- ✅ **Admin Dashboard** - Central directory listing all staff members
- ✅ **Review Collection** - Easy way for customers to leave Google reviews

## 📁 Project Structure

```
QR-CODE/
├── generate_salesman.py           # Main generator script
├── templates/
│   ├── profile_template.html      # Individual staff member page template
│   └── admin_list_template.html   # Admin dashboard template
├── static/
│   └── css/                       # Custom CSS overrides (optional)
├── staff/                         # Generated staff HTML pages
├── qrcodes/                       # Generated QR code images (Google Reviews)
├── requirements.txt               # Python dependencies
├── index.html                     # Auto-generated admin dashboard
└── README.md                      # This file
```

## 🚀 Quick Start

### 📋 Prerequisites

You need **Python 3.7 or higher** installed. Download from [python.org](https://www.python.org/downloads/)

⚠️ **IMPORTANT:** Check "Add Python to PATH" during installation!

### ⚡ Fastest Setup (Windows)

**Option 1: One-Click Setup (Recommended)**
```bash
# Double-click this file:
setup_complete.bat
```
This automatically installs dependencies and sets up everything.

**Option 2: Manual Setup**
```bash
# Step 1: Install dependencies
install.bat   # or: pip install -r requirements.txt

# Step 2: Generate a salesman profile
run.bat       # or: python generate_salesman.py

# Step 3: Deploy to GitHub
deploy.bat    # or manually commit and push
```

**Option 3: Portable (No Installation Required)**

See `PORTABLE_SETUP.md` for running from USB or without admin rights.

### 🎯 Generate a Staff Member Profile

**Windows:** Double-click `run.bat`
**Command Line:**
```bash
python generate_salesman.py
```

Follow the prompts to:
1. Enter the staff member's name
2. Select their role (Salesman, Technician, or Custom)

The script will:
- Create a unique profile page in `/staff/`
- Generate a QR code pointing to your Google Reviews page
- Update the admin dashboard (`index.html`)

### 🌐 Deploy to GitHub Pages

#### First Time Setup

**Never used GitHub before?** 📘 **Read: `🌐 GITHUB_SETUP_GUIDE.txt`**
- Complete walkthrough from creating a GitHub account to going live
- Every single step explained with screenshots descriptions
- Perfect for beginners!

**Already have GitHub?** Quick setup:

1. **Initialize Git Repository**
   ```bash
   git init
   git add .
   git commit -m "Initial commit: AgeintSec Staff Portal"
   ```

2. **Create GitHub Repository**
   - Go to [GitHub](https://github.com/new)
   - Create a repository named `QR-CODE`
   - Make it **Public**
   - **Do NOT** initialize with README

3. **Link and Push**
   ```bash
   git remote add origin https://github.com/ageintsec-tutorials/QR-CODE.git
   git branch -M main
   git push -u origin main
   ```

4. **Enable GitHub Pages**
   - Go to repository Settings → Pages
   - Source: Deploy from branch `main`
   - Folder: `/ (root)`
   - Click Save
   - Wait 1-2 minutes for deployment

#### Adding New Salesmen

**Easy Way (Windows):**
```bash
run.bat      # Generate new profile
deploy.bat   # Automatically commit and push to GitHub
```

**Manual Way:**
```bash
python generate_salesman.py  # Generate new profile
git add .
git commit -m "Add profile for [Salesman Name]"
git push origin main
```

Wait 1-2 minutes for GitHub Pages to rebuild, then visit:
- **Profile:** `https://ageintsec-tutorials.github.io/QR-CODE/salesmen/[slug].html`
- **Dashboard:** `https://ageintsec-tutorials.github.io/QR-CODE/`

## 🎨 Customization

### Change Google Review URL

Edit `generate_salesman.py` and modify the `GOOGLE_REVIEW_URL` constant:

```python
GOOGLE_REVIEW_URL = "https://search.google.com/local/writereview?placeid=YOUR_PLACE_ID"
```

### Change Base URL

Edit `generate_salesman.py` and modify the `BASE_URL` constant:

```python
BASE_URL = "https://your-username.github.io/your-repo"
```

### Customize Design

1. **Profile Page:** Edit `templates/profile_template.html`
2. **Admin Dashboard:** Edit `templates/admin_list_template.html`
3. **Custom CSS:** Add files to `static/css/` and link in templates

### Contact Button

The "Contact Office" button is currently a placeholder (`href="#contact"`). Update it in `templates/profile_template.html`:

```html
<a href="tel:+1234567890" class="btn waves-effect waves-light contact-btn">
    <i class="material-icons left">phone</i>
    Contact Office
</a>
```

Or link to a contact form:

```html
<a href="https://yourcompany.com/contact" class="btn waves-effect waves-light contact-btn">
```

## 📱 How It Works

1. **Generator Script** creates:
   - A unique slug from the staff member's name (e.g., "John Doe" → "john-doe")
   - A QR code pointing to your Google Reviews page
   - An HTML page from the Jinja2 template with the staff member's info

2. **QR Code** contains:
   ```
   https://search.google.com/local/writereview?placeid=ChIJ65CsoCI0R4YRAssAAswitSw
   ```
   *(All QR codes point to the same Google Reviews URL)*

3. **GitHub Pages** hosts all static files publicly

4. **Admin Dashboard** automatically updates with all staff profiles

5. **Customer Flow**:
   - Customer meets salesman/technician
   - Scans QR code on business card or profile page
   - Taken directly to Google Reviews
   - Leaves a review for AgeintSec!

## 🔧 Troubleshooting

### "Python is not recognized" Error

**Fix:**
1. Reinstall Python with "Add to PATH" checked
2. **OR** use portable Python (see `PORTABLE_SETUP.md`)
3. **OR** run `run_portable.bat` instead

### "Module not found" Error

**Fix:**
```bash
# Run the installer
install.bat

# Or manually install
pip install -r requirements.txt
```

### Test Your Installation

```bash
# Double-click this to verify everything works:
test_installation.bat
```

### QR Codes Not Loading

- Ensure relative paths are correct: `../qrcodes/name.png`
- Check that files were committed to GitHub
- Wait for GitHub Pages to rebuild (1-2 minutes)

### Profile Not Found (404)

- Verify the file exists in `/salesmen/`
- Check the URL slug matches the filename
- Ensure repository is public and GitHub Pages is enabled

### Regenerate All Pages

If you change the template or base URL:

```bash
# Delete existing pages (Windows)
del /Q salesmen\*.html qrcodes\*.png index.html

# Or on Linux/Mac
rm -rf salesmen/*.html qrcodes/*.png index.html

# Regenerate (you'll need to re-run for each salesman)
python generate_salesman.py
```

## 📦 Installer Files Reference

| File | Purpose |
|------|---------|
| `START_HERE.txt` | 👈 **Read this first!** Choose your installation method |
| `setup_complete.bat` | One-click complete setup (installs + tests) |
| `install.bat` / `install.ps1` | Install Python dependencies |
| `run.bat` / `run.ps1` | Generate salesman profiles |
| `deploy.bat` | Quick deploy to GitHub Pages |
| `test_installation.bat` | Verify everything is working |
| `run_portable.bat` | Run with portable Python (WinPython) |
| `run_embedded.bat` | Run with embedded Python |
| `QUICK_START.txt` | Simple step-by-step guide |
| `PORTABLE_SETUP.md` | How to make fully portable |

## 📋 Requirements

- Python 3.7+
- Dependencies (auto-installed via `install.bat` or `requirements.txt`):
  - `qrcode[pil]` - QR code generation
  - `jinja2` - Template rendering
  - `Pillow` - Image processing

## 📄 License

This project is open source and available for use by AgeintSec Security Solutions.

## 🤝 Support

For issues or questions, contact the development team or open an issue on GitHub.

---

**Built with ❤️ using Python, Jinja2, and Materialize CSS**
