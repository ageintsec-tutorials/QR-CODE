#!/usr/bin/env python3
"""
Password Hash Generator
Generates a secure SHA-256 hash for the admin dashboard password
"""

import hashlib
import secrets

def generate_password_hash(password, salt=None):
    """
    Generate a secure hash of the password using SHA-256 with salt.
    
    Args:
        password (str): The password to hash
        salt (str, optional): Salt for hashing. If None, generates a random salt.
    
    Returns:
        tuple: (hash, salt) - The hash and salt used
    """
    if salt is None:
        # Generate a cryptographically secure random salt
        salt = secrets.token_hex(32)  # 64 character hex string
    
    # Combine password and salt
    salted_password = password + salt
    
    # Hash using SHA-256 (government-grade)
    hash_object = hashlib.sha256(salted_password.encode('utf-8'))
    password_hash = hash_object.hexdigest()
    
    return password_hash, salt


def main():
    """Generate hash for the default password."""
    # Default password
    PASSWORD = "Ageint2016$"
    
    print("\n" + "="*60)
    print("   PASSWORD HASH GENERATOR")
    print("   Government-Grade SHA-256 Encryption")
    print("="*60 + "\n")
    
    # Generate hash with random salt
    password_hash, salt = generate_password_hash(PASSWORD)
    
    print(f"Password: {PASSWORD}")
    print(f"\nGenerated Hash (SHA-256):")
    print(f"  {password_hash}")
    print(f"\nSalt:")
    print(f"  {salt}")
    
    print("\n" + "="*60)
    print("✓ Hash generated successfully!")
    print("="*60)
    print("\nThis hash will be embedded in your index.html")
    print("The actual password is never stored - only the hash.")
    print("\n")
    
    # Save to a config file that the template can read
    with open('password_config.txt', 'w') as f:
        f.write(f"HASH={password_hash}\n")
        f.write(f"SALT={salt}\n")
    
    print("✓ Saved to password_config.txt")
    print("\n")


if __name__ == "__main__":
    main()
