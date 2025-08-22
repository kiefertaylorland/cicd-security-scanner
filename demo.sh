#!/bin/bash
set -e

echo "🔒 CI/CD Security Scanner - Local Demo"
echo "======================================"
echo

# Check if semgrep is installed
if ! command -v semgrep &> /dev/null; then
    echo "❌ Semgrep not found. Installing..."
    pip install semgrep
    echo "✅ Semgrep installed successfully!"
    echo
fi

# Create output directory
mkdir -p demo-output

echo "🔍 Running security scan on demo applications..."
echo

# Run Semgrep scan
echo "📊 Scanning with Semgrep rules..."
semgrep \
    --config=auto \
    --config=p/security-audit \
    --config=p/secrets \
    --config=p/owasp-top-ten \
    --json \
    --output=demo-output/scan-results.json \
    src/ || true

# Generate summary
echo
echo "📈 Generating scan summary..."

if [ -f "demo-output/scan-results.json" ]; then
    # Count vulnerabilities by severity
    HIGH_COUNT=$(jq '[.results[] | select(.extra.severity == "ERROR")] | length' demo-output/scan-results.json 2>/dev/null || echo "0")
    MEDIUM_COUNT=$(jq '[.results[] | select(.extra.severity == "WARNING")] | length' demo-output/scan-results.json 2>/dev/null || echo "0")
    LOW_COUNT=$(jq '[.results[] | select(.extra.severity == "INFO")] | length' demo-output/scan-results.json 2>/dev/null || echo "0")
    TOTAL_COUNT=$(jq '.results | length' demo-output/scan-results.json 2>/dev/null || echo "0")
    
    echo
    echo "🎯 SCAN RESULTS SUMMARY"
    echo "======================="
    echo "🔴 High Risk:   $HIGH_COUNT"
    echo "🟡 Medium Risk: $MEDIUM_COUNT"  
    echo "🟢 Low Risk:    $LOW_COUNT"
    echo "📊 Total:       $TOTAL_COUNT"
    echo
    
    if [ "$TOTAL_COUNT" -gt "0" ]; then
        echo "🔍 Sample findings:"
        jq -r '.results[0:3][] | "  • \(.extra.message) (\(.path):\(.start.line))"' demo-output/scan-results.json 2>/dev/null || echo "  (Unable to parse findings)"
        echo
        echo "📄 Full results saved to: demo-output/scan-results.json"
    else
        echo "✅ No security issues found!"
    fi
else
    echo "❌ Failed to generate scan results"
fi

echo
echo "🎬 Demo complete!"
echo
echo "Next steps:"
echo "1. 🔗 Push this code to GitHub to trigger the full CI/CD pipeline"
echo "2. 📊 View automated reports at https://YOUR_USERNAME.github.io/cicd-security-scanner/"
echo "3. 🛡️ Check GitHub Security tab for detailed findings"
echo "4. 🏷️ See the security badge update automatically"
echo
