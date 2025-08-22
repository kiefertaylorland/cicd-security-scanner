#!/usr/bin/env python3
"""
Sample web application with intentional security vulnerabilities for SAST scanning demo.
This is for educational purposes only - DO NOT use in production!
"""

import os
import sqlite3
import subprocess
from flask import Flask, request, render_template_string

app = Flask(__name__)

# Vulnerability 1: Hardcoded secret
API_KEY = "sk-1234567890abcdef"  # nosemgrep: hardcoded-api-key

# Vulnerability 2: SQL Injection
@app.route('/user')
def get_user():
    user_id = request.args.get('id')
    conn = sqlite3.connect('users.db')
    cursor = conn.cursor()
    # Intentionally vulnerable SQL query
    query = f"SELECT * FROM users WHERE id = {user_id}"
    cursor.execute(query)
    result = cursor.fetchone()
    conn.close()
    return str(result)

# Vulnerability 3: Command Injection
@app.route('/ping')
def ping_host():
    host = request.args.get('host', 'localhost')
    # Intentionally vulnerable command execution
    result = subprocess.run(f"ping -c 1 {host}", shell=True, capture_output=True, text=True)
    return f"<pre>{result.stdout}</pre>"

# Vulnerability 4: Server-Side Template Injection (SSTI)
@app.route('/template')
def render_template():
    template = request.args.get('template', 'Hello World!')
    # Intentionally vulnerable template rendering
    return render_template_string(template)

# Vulnerability 5: Path Traversal
@app.route('/file')
def read_file():
    filename = request.args.get('filename', 'README.md')
    try:
        # Intentionally vulnerable file reading
        with open(filename, 'r') as f:
            content = f.read()
        return f"<pre>{content}</pre>"
    except Exception as e:
        return f"Error: {str(e)}"

if __name__ == '__main__':
    # Vulnerability 6: Debug mode in production
    app.run(debug=True, host='0.0.0.0')
