# Security Policy

## Supported Versions

This project demonstrates security scanning capabilities. The following versions are actively maintained:

| Version | Supported          |
| ------- | ------------------ |
| 1.x.x   | :white_check_mark: |

## Reporting a Vulnerability

This repository contains **intentionally vulnerable code** for demonstration purposes only.

If you discover a security vulnerability in the scanning infrastructure itself (not the demo code), please report it by:

1. **Do NOT** open a public issue
2. Email the maintainer with details
3. Include steps to reproduce the vulnerability
4. Allow 48 hours for initial response

## Vulnerability Disclosure

- Confirmed vulnerabilities will be addressed within 7 days
- Security updates will be released as patch versions
- Public disclosure will occur after patches are available

## Demo Code Disclaimer

⚠️ **WARNING**: The code in the `/src` directory contains **intentional security vulnerabilities** for educational purposes.

**DO NOT use this code in production environments!**

These vulnerabilities include:

- SQL Injection
- Command Injection  
- Cross-Site Scripting (XSS)
- Path Traversal
- Hardcoded Secrets
- Server-Side Template Injection

The purpose is to demonstrate how the SAST scanning pipeline detects these issues.
