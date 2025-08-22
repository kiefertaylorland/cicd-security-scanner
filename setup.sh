#!/bin/bash

echo "🚀 Setting up CI/CD Security Scanner Project"
echo "============================================"
echo

# Initialize git repository if not already initialized
if [ ! -d ".git" ]; then
    echo "📦 Initializing Git repository..."
    git init
    git add .
    git commit -m "🔒 Initial commit: CI/CD Security Scanner MVP"
    echo "✅ Git repository initialized!"
else
    echo "✅ Git repository already exists"
fi

echo
echo "🔧 Project Setup Complete!"
echo
echo "📁 Project Structure:"
echo "├── .github/workflows/security-scan.yml  # Main CI/CD pipeline"
echo "├── src/                                 # Demo vulnerable applications"
echo "│   ├── app.py                          # Python app with vulnerabilities"
echo "│   ├── server.js                       # Node.js app with vulnerabilities"
echo "│   ├── requirements.txt                # Python dependencies"
echo "│   └── package.json                    # Node.js dependencies"
echo "├── README.md                           # Comprehensive documentation"
echo "├── SECURITY.md                         # Security policy"
echo "├── CONTRIBUTING.md                     # Contribution guidelines"
echo "├── demo.sh                             # Local testing script"
echo "└── setup.sh                            # This setup script"
echo
echo "🎯 Next Steps:"
echo "1. 📤 Push to GitHub:"
echo "   git remote add origin https://github.com/YOUR_USERNAME/cicd-security-scanner.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo
echo "2. ⚙️ Configure GitHub repository:"
echo "   • Enable GitHub Pages (Settings > Pages > Source: GitHub Actions)"
echo "   • Update README badge URLs with your username"
echo "   • Optionally add Semgrep secrets for enhanced features"
echo
echo "3. 🧪 Test locally:"
echo "   ./demo.sh"
echo
echo "4. 🔍 Monitor security:"
echo "   • Check Actions tab for pipeline execution"
echo "   • View Security tab for vulnerability findings"
echo "   • Access reports at YOUR_USERNAME.github.io/cicd-security-scanner/"
echo
echo "🎉 Your CI/CD Security Scanner is ready!"
echo "Visit the repository to see the automated security scanning in action."
