#!/usr/bin/env python3
"""
Simple script to regenerate index.html with password protection
Run this with: py refresh_index.py (or python refresh_index.py)
"""

from generate_salesman import generate_admin_dashboard

if __name__ == "__main__":
    print("\n" + "="*60)
    print("   REGENERATING ADMIN DASHBOARD")
    print("="*60 + "\n")
    
    generate_admin_dashboard()
    
    print("\n" + "="*60)
    print("   SUCCESS!")
    print("="*60)
    print("\nindex.html has been regenerated with password protection.")
    print("\nNext steps:")
    print("  1. Push to GitHub:")
    print('     git add . && git commit -m "Add secure index" && git push')
    print("  2. Wait 1-2 minutes")
    print("  3. Visit: https://ageintsec-tutorials.github.io/QR-CODE/")
    print("  4. You'll see the login screen!")
    print("\nPassword: Ageint2016$")
    print("\n")
    
    input("Press Enter to continue...")
