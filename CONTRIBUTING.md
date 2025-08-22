# Contributing to CI/CD Security Scanner

Thank you for your interest in contributing! This project demonstrates SAST integration in CI/CD pipelines.

## How to Contribute

### 🐛 Report Issues

- Use GitHub Issues to report bugs in the scanning pipeline
- **Do NOT report issues** with the intentionally vulnerable demo code
- Include steps to reproduce and expected vs actual behavior

### 🔧 Suggest Enhancements

- Additional security scanners (DAST, dependency scanning, etc.)
- New badge designs or report formats
- Integration with other CI/CD platforms
- Performance improvements

### 🛠️ Code Contributions

#### Setup Development Environment

```bash
# Fork and clone the repository
git clone https://github.com/YOUR_USERNAME/cicd-security-scanner.git
cd cicd-security-scanner

# Create a feature branch
git checkout -b feature/your-feature-name

# Test the workflow locally (optional)
pip install semgrep
semgrep --config=auto src/
```

#### Pull Request Process

1. **Keep changes focused** - One feature/fix per PR
2. **Update documentation** - Modify README if needed
3. **Test thoroughly** - Ensure GitHub Actions workflow passes
4. **Write clear commit messages** - Describe what and why

#### Code Guidelines

- Use clear, descriptive variable names
- Add comments for complex logic
- Follow existing code style
- Ensure security scanning passes

### 🔒 Security Considerations

- Never commit real secrets or credentials
- Keep intentional vulnerabilities clearly marked
- Test all security tool integrations thoroughly
- Document any new security implications

### 🎯 Good First Issues

- Add support for new programming languages
- Improve HTML report styling
- Add more badge variations
- Create additional workflow examples

## Development Ideas

### Easy Contributions

- [ ] Add support for Python `bandit` scanner
- [ ] Create different badge themes
- [ ] Improve error handling in workflows
- [ ] Add more comprehensive documentation

### Medium Contributions  

- [ ] Add container scanning with Trivy
- [ ] Implement dependency vulnerability scanning
- [ ] Create custom Semgrep rules
- [ ] Add integration tests

### Advanced Contributions

- [ ] Multi-cloud deployment examples
- [ ] Enterprise features (SSO, audit logs)
- [ ] Custom reporting dashboards
- [ ] Integration with external security tools

## Questions?

Feel free to open an issue for discussion or reach out to maintainers.

Happy contributing! 🚀
