/**
 * Sample Node.js application with intentional security vulnerabilities for SAST scanning demo.
 * This is for educational purposes only - DO NOT use in production!
 */

const express = require('express');
const { exec } = require('child_process');
const fs = require('fs');
const path = require('path');

const app = express();
app.use(express.json());

// Vulnerability 1: Hardcoded credentials
const DB_PASSWORD = "admin123"; // nosemgrep: hardcoded-password

// Vulnerability 2: Command Injection
app.get('/execute', (req, res) => {
    const command = req.query.cmd;
    // Intentionally vulnerable command execution
    exec(command, (error, stdout, stderr) => {
        if (error) {
            return res.status(500).json({ error: error.message });
        }
        res.json({ output: stdout });
    });
});

// Vulnerability 3: Path Traversal
app.get('/download', (req, res) => {
    const filename = req.query.file;
    // Intentionally vulnerable file access
    const filePath = path.join(__dirname, 'uploads', filename);
    
    fs.readFile(filePath, (err, data) => {
        if (err) {
            return res.status(404).json({ error: 'File not found' });
        }
        res.send(data);
    });
});

// Vulnerability 4: SQL Injection (if using raw queries)
app.get('/user', (req, res) => {
    const userId = req.query.id;
    // This would be vulnerable if connected to a real database
    const query = `SELECT * FROM users WHERE id = ${userId}`;
    console.log(`Executing query: ${query}`);
    res.json({ message: "User data would be returned here" });
});

// Vulnerability 5: Cross-Site Scripting (XSS)
app.get('/search', (req, res) => {
    const searchTerm = req.query.q;
    // Intentionally vulnerable - no sanitization
    const html = `
        <html>
            <body>
                <h1>Search Results</h1>
                <p>You searched for: ${searchTerm}</p>
            </body>
        </html>
    `;
    res.send(html);
});

// Vulnerability 6: Weak cryptography
const crypto = require('crypto');
app.get('/encrypt', (req, res) => {
    const data = req.query.data || 'secret';
    // Intentionally using weak encryption
    const cipher = crypto.createCipher('des', 'weak-key');
    let encrypted = cipher.update(data, 'utf8', 'hex');
    encrypted += cipher.final('hex');
    res.json({ encrypted });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});

module.exports = app;
