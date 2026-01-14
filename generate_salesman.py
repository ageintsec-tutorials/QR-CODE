#!/usr/bin/env python3
"""
Static Salesman Portal Generator
Generates static HTML pages for salesmen with QR codes for GitHub Pages deployment.
"""

import os
import re
from pathlib import Path
import qrcode
from jinja2 import Environment, FileSystemLoader

# ============ CONFIGURATION ============
BASE_URL = "https://ageintsec-tutorials.github.io/QR-CODE"
GOOGLE_REVIEW_URL = "https://search.google.com/local/writereview?placeid=ChIJ65CsoCI0R4YRAssAAswitSw"
# =======================================

def create_slug(name):
    """Convert a name to a URL-safe slug."""
    slug = name.lower()
    slug = re.sub(r'[^a-z0-9]+', '-', slug)
    slug = slug.strip('-')
    return slug

def ensure_directories():
    """Create necessary directories if they don't exist."""
    directories = ['staff', 'qrcodes', 'templates', 'static/css']
    for directory in directories:
        Path(directory).mkdir(parents=True, exist_ok=True)
        print(f"✓ Directory ensured: {directory}/")

def generate_qr_code(url, output_path):
    """Generate a QR code for the given URL."""
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_H,
        box_size=10,
        border=4,
    )
    qr.add_data(url)
    qr.make(fit=True)
    
    img = qr.make_image(fill_color="black", back_color="white")
    img.save(output_path)
    print(f"✓ QR code generated: {output_path}")

def generate_staff_page(name, slug, role):
    """Generate a static HTML page for a staff member (salesman or technician)."""
    # Setup Jinja2 environment
    env = Environment(loader=FileSystemLoader('templates'))
    template = env.get_template('profile_template.html')
    
    # Generate QR code pointing to Google Review URL
    qr_filename = f"{slug}.png"
    qr_path = f"qrcodes/{qr_filename}"
    
    generate_qr_code(GOOGLE_REVIEW_URL, qr_path)
    
    # Render template
    page_url = f"{BASE_URL}/staff/{slug}.html"
    html_content = template.render(
        staff_name=name,
        staff_role=role,
        qr_filename=qr_filename,
        google_review_url=GOOGLE_REVIEW_URL
    )
    
    # Save HTML file
    output_path = f"staff/{slug}.html"
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(html_content)
    
    print(f"✓ Profile page generated: {output_path}")
    print(f"✓ Profile URL: {page_url}")
    print(f"✓ QR code points to: {GOOGLE_REVIEW_URL}")
    
    return slug, qr_filename, role

def get_all_staff():
    """Scan the staff folder and return list of all staff members."""
    staff_members = []
    staff_dir = Path('staff')
    
    if not staff_dir.exists():
        return staff_members
    
    for html_file in staff_dir.glob('*.html'):
        slug = html_file.stem
        # Reconstruct name from slug (capitalize each word)
        name = slug.replace('-', ' ').title()
        qr_filename = f"{slug}.png"
        
        # Try to determine role from filename pattern or default to "Staff"
        role = "Staff Member"
        
        staff_members.append({
            'name': name,
            'slug': slug,
            'qr_filename': qr_filename,
            'role': role
        })
    
    # Sort by name
    staff_members.sort(key=lambda x: x['name'])
    return staff_members

def generate_admin_dashboard():
    """Generate the admin dashboard (index.html) with all staff members."""
    import hashlib
    
    env = Environment(loader=FileSystemLoader('templates'))
    template = env.get_template('admin_list_template.html')
    
    staff_members = get_all_staff()
    
    # Generate password hash (change PASSWORD below to set your own)
    PASSWORD = "Ageint2016$"  # ⚠️ CHANGE THIS to your own password
    SALT = "a5f8c2d7e9b3c5d8a6f9c4b7e1d3a5f8c2d7e9b3c5d8a6f9c4b7e1d3a5f8c2d7"
    salted_password = PASSWORD + SALT
    password_hash = hashlib.sha256(salted_password.encode('utf-8')).hexdigest()
    
    html_content = template.render(
        staff_members=staff_members,
        google_review_url=GOOGLE_REVIEW_URL
    )
    
    # Inject the actual hash into the HTML
    html_content = html_content.replace(
        'const STORED_HASH = "7e8f3c9d4b6a1e5f8c2d7a9e3b5f4c8d6a1e9f7b3c5d8e2a6f9c4b7e1d3a5f8c";',
        f'const STORED_HASH = "{password_hash}";'
    )
    
    with open('index.html', 'w', encoding='utf-8') as f:
        f.write(html_content)
    
    print(f"✓ Admin dashboard updated: index.html ({len(staff_members)} staff members)")
    print(f"✓ Password protection enabled (SHA-256 encryption)")

def main():
    """Main function to run the staff member generator."""
    print("\n" + "="*60)
    print("   STAFF PORTAL GENERATOR")
    print("   Ageint Security Solutions")
    print("="*60 + "\n")
    
    # Ensure all directories exist
    ensure_directories()
    
    # Get staff member name from user
    print("Enter staff member's full name (or 'quit' to exit):")
    name = input("> ").strip()
    
    if not name or name.lower() == 'quit':
        print("\n✗ No name provided. Exiting.")
        return
    
    # Get role from user
    print("\nSelect role:")
    print("  1. Salesman")
    print("  2. Technician")
    print("  3. Other (you'll type it)")
    role_choice = input("> ").strip()
    
    if role_choice == '1':
        role = "Salesman"
    elif role_choice == '2':
        role = "Technician"
    elif role_choice == '3':
        print("Enter custom role:")
        role = input("> ").strip() or "Staff Member"
    else:
        role = "Staff Member"
    
    # Generate slug
    slug = create_slug(name)
    print(f"\n→ Slug created: {slug}")
    print(f"→ Role: {role}")
    
    # Check if staff member already exists
    if Path(f"staff/{slug}.html").exists():
        print(f"\n⚠ Warning: A profile for '{name}' already exists!")
        response = input("Do you want to regenerate it? (yes/no): ").strip().lower()
        if response not in ['yes', 'y']:
            print("✗ Cancelled.")
            return
    
    print("\n→ Generating profile...\n")
    
    # Generate staff page and QR code
    generate_staff_page(name, slug, role)
    
    # Update admin dashboard
    print("\n→ Updating admin dashboard...\n")
    generate_admin_dashboard()
    
    print("\n" + "="*60)
    print(f"   ✓ SUCCESS! {role} profile created.")
    print("="*60)
    print(f"\n{name}'s Personal Review Page:")
    print(f"  → {BASE_URL}/staff/{slug}.html")
    print(f"\nWhat to do:")
    print(f"  1. Send the link above to {name}")
    print(f"  2. They should bookmark it on their phone")
    print(f"  3. They open it and show customers")
    print(f"  4. Customers scan the QR code → leave reviews!")
    print(f"\nQR Code Location:")
    print(f"  → qrcodes/{slug}.png (for printing on business cards)")
    print(f"\nTo deploy to GitHub:")
    print(f'  git add .')
    print(f'  git commit -m "Add {role} profile for {name}"')
    print(f'  git push origin main')
    print(f"\n💡 TIP: Give {name} the link to bookmark on their phone!")
    print(f"    See: 📱 PHONE_USAGE_GUIDE.txt for instructions")
    print("\n")

if __name__ == "__main__":
    main()
